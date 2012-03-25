#**********************************************************************
#*                                                                    *
#*  RmThemeGen - a ruby script to create random, usable themes for    *
#*  text editors. Currently supports RubyMine 3.X.X and Textmate,     *
#*  sublime2                                                          *
#*                                                                    *
#*  By David Heitzman, 2011                                           *
#*                                                                    *
#**********************************************************************

#this is a version of the software that should work with ruby 1.8.7

require File.dirname(__FILE__)+'/rmthemegen_parent'

module RMThemeGen
  class ThemeTextmate < RMThemeParent
   
   def unique_number(n=-1)
      @unique_num ||= n
      @unique_num += 1 
      @unique_num
   end 
   
   def initialize
      super
      @bold_chance = 0.4
      @underline_chance = 0.3
      @italic_candidates = []
      @bold_candidates = []
# with code inspections we don't color the text, we just put a line or something under it .
      @code_inspections = []
      @cross_out = [ ]
      
      @underline_candidates = []
      @italic_chance = 0.2
   end 
   
   def set_doc_options(dd)
      @document_globals[:backgroundcolor]=@backgroundcolor
      @document_globals[:caret_color]= randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.30,:max_cont=>0.7,:shade_of_grey=>true)
      @document_globals[:text]=randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.24,:max_cont=>0.7,:shade_of_grey=>false) #TEXT should hardly ever appears, since every possible color is stipulated
      @document_globals[:caret_row_color] = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.05,:max_cont => 0.08,:shade_of_grey=>false)
      @document_globals[:selection_background] = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.07,:max_cont => 0.09,:shade_of_grey=>false)

      dd.add_element(
         make_dict(
         :background=>"#"+@document_globals[:backgroundcolor].upcase,
         :caret=>"#"+ @document_globals[:caret_color].upcase ,
         :foreground=>"#"+@document_globals[:text].upcase,
         :invisibles=>"#"+@document_globals[:backgroundcolor].upcase,
         :lineHighlight=>"#"+@document_globals[:caret_row_color].upcase,
         :selection=>"#"+@document_globals[:selection_background].upcase
         ) 
      ) 
   end 
   
   #subclass
   def before_create(outputdir, bg_color_style, colorsets, rand_seed)
      super(outputdir, bg_color_style, colorsets, rand_seed)
   end
    
    def set_doc_colors
    end

    def set_element_colors
    end 
   
   
    def make_theme_from_hash
    end 

    def make_theme_text(bg_color_style=:dark, colorsets=[], rand_seed=nil, opts_hash={})
      create_textmate_theme( bg_color_style = :dark, colorsets=[], rand_seed=nil, opts_hash )
    end    
   
    def make_theme_file( outputdir = ENV["PWD"], bg_color_style=:dark, colorsets=[], rand_seed=nil, opts_hash={} )
      outt=create_textmate_theme(bg_color_style , colorsets, rand_seed, opts_hash) #@themename gets set by that there call, so we need it to happen before we use the filename
      @savefile = File.expand_path(outputdir)+"/rmt_"+@themename+".tmTheme"
      File.open(@savefile, "w") do |f|
        f.puts( outt )
      end 
      @savefile
    end 
 
    def create_textmate_theme(bg_color_style=:dark, colorsets=[], rand_seed=nil, opts_hash={})
      opts_hash[:punctuation_bold] = 0.2 
      opts_hash[:backgrounds_colored] = 0.05

      #returns string of a plist xml file that should work in textmate.  
      handle_rand_seed(rand_seed)
      before_create( '.',bg_color_style, colorsets, rand_seed) 
      #it will save the theme file ".tmTheme" in the same directory as other themes
      #it will return the full name and path of that theme file.
    
      @theme_successfully_created=false
        rexmlout = REXML::Document.new
        rexmlout << REXML::DocType.new('plist','PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"')
        rexmlout << REXML::XMLDecl.new("1.0","UTF-8",nil)
        plist = REXML::Element.new "plist"
        plist.add_attributes( "version"=>"1.0")
        dict = REXML::Element.new( "dict", plist) #causes plist to be the parent of dict
        dict.add_text(REXML::Element.new("key").add_text("name") )
        dict.add_text(REXML::Element.new("string").add_text( @themename ) )
        dict.add_text(REXML::Element.new("key").add_text("author") )
        dict.add_text(REXML::Element.new("string").add_text("David Heitzman") )
        dict.add_text(REXML::Element.new("key").add_text("settings") )
        main_array = REXML::Element.new("array",dict)
        doc_dict = REXML::Element.new("dict",main_array)
        doc_dict.add_text(REXML::Element.new("key").add_text("settings") )

        set_doc_options(doc_dict)
        
        process_plists()

        scopes_found=get_scopes_from_themefiles()
        co2 =0
        @used_names ={}
        
        #group_2_color.each do |g,c| group_2_color[g] = "#"+randcolor(:bg_rgb=>@backgroundcolor).upcase end   
        
        @new_color_to_group = {} #so this will have a key from each color to its group and also a key for each scope to its color
        @color_2_group.each do |c,g|
          fontStyle=''
          if g.join(' ').upcase.include?( "ITALIC" ) || rand < (@italic_chance/2) 
            fontStyle +="italic "
          end 
          if g.join(' ').upcase.include?( "BOLD" ) || rand < (@bold_chance/2)
            fontStyle += "bold "
          end 
          newcol =  "#"+randcolor(:bg_rgb=>@backgroundcolor).upcase
          @new_color_to_group[newcol] = color_2_group[c]
          
          g.each do |s|
            @new_color_to_group[s] = {:foreground=>newcol,:fontStyle=>fontStyle.chop!}
          end
        end 
        
        scopes_found.each_index do |k|
          v=scopes_found[k]  
          if  self.scopes_found_count[v] > 0
            scope_text = v
            scope_text = scope_text.split(",")[0] if v.include?(",") 
            scope_text = scope_text.split[0].split(".") #this takes the first whole token prior to any spaces, then makes the array out of the substrings separated by periods
            elname = " ~ "+scope_text[0] || " ! "+unique_number.to_s
            co=1 
            while !@used_names[elname].nil?
               if scope_text[co]
                  elname += "."+scope_text[co] 
               else
                  elname += unique_number.to_s
               end 
            co += 1
            end
#   puts 'rmtg_textmate:131 '+elname 
#   puts 'the scope that kills it: "'+v.to_s 
#            elname = "uniquename"+unique_number.to_s 
            @used_names[elname] = true
            main_array.add_element(
            # so it's  make_name_scope_settings_rand(name,scope,[don't worry about it, but colors you can assign manually]) 
                make_name_scope_settings_rand(elname,v,[])
            )  
            co2 += 1 
          end
        end 

#        variable.other.readwrite.instance.ruby
#        variable.other.readwrite.class.ruby

        uuid_key = REXML::Element.new("key")
        uuid_key.add_text("uuid")
        uuid_element = REXML::Element.new("string")
        uuid_element.add_text( gen_uuid)
        dict.add_element uuid_key
        dict.add_element uuid_element

        rexmlout << plist
        formatter = REXML::Formatters::Pretty.new
        formatter.compact=true
        @output=''
        formatter.write(rexmlout, @output)
        @theme_successfully_created = true
        @output
    end


    
    def make_dict(a_hash)
      new_dict = REXML::Element.new("dict")
      a_hash.each do |k,v| 
        te1 = REXML::Element.new("key")      
        te1.add_text(k.to_s) 
        te2 = REXML::Element.new("string")      
        te2.add_text(v.to_s)
        new_dict.add_element te1
        new_dict.add_element te2
      end
      return new_dict
    end 
    
    def make_name_scope_settings(ruby_symbol,an_array)
    fontstyles = ["","bold","italic", "bold italic"]
      #the array looks like ["name","scope",{}] . the third element in the array is a hash for "settings"
        new_dict = REXML::Element.new("dict")
        te1 = REXML::Element.new("key")      
        te1.add_text("name") 
        te2 = REXML::Element.new("string")      
        te2.add_text(an_array[0])
        te3 = REXML::Element.new("key")      
        te3.add_text("scope")
        te4 = REXML::Element.new("string")      
        te4.add_text(an_array[1])
        te5 = REXML::Element.new("key")
        te5.add_text("settings")      
        new_dict.add_element te1
        new_dict.add_element te2
        new_dict.add_element te3
        new_dict.add_element te4
        new_dict.add_element te5
        fontStyle = fontstyles[@textmate_hash[ruby_symbol][:FONT_TYPE].to_i ]
        di1 = make_dict(:foreground => "#"+@textmate_hash[ruby_symbol][:FOREGROUND].upcase, :fontStyle=>fontStyle) 
        new_dict.add_element di1
      return new_dict
    end
    
    def make_name_scope_settings_rand(name, scope, settings)
    fontstyles = ["","bold","italic", "bold italic"]
      #the array looks like ["name","scope",{}] . the third element in the array is a hash for "settings"
        new_dict = REXML::Element.new("dict")
        te1 = REXML::Element.new("key")      
        te1.add_text("name") 
        te2 = REXML::Element.new("string")      
        te2.add_text(name.to_s)
        te3 = REXML::Element.new("key")      
        te3.add_text("scope")
        te4 = REXML::Element.new("string")      
        te4.text =scope.to_s
        te5 = REXML::Element.new("key")
        te5.add_text("settings")      
        new_dict.add_element te1
        new_dict.add_element te2
        new_dict.add_element te3
        new_dict.add_element te4
        new_dict.add_element te5
          
#puts "scope= #{scope} , group= #{@scope_2_group[scope]} , newcolor = "+newcolor.to_s          
        
        if @new_color_to_group[scope] 
puts "scope= #{scope} , group= #{@scope_2_group[scope]} , newcolor = "+@new_color_to_group[scope][:foreground]+ " , fonStyle=#{@new_color_to_group[scope][:fontStyle]}"          
          di1 = make_dict(@new_color_to_group[scope])   
        else
          di1 = make_dict(:fontStyle=>'')
        end 
      new_dict.add_element di1
      return new_dict
    end
    
    def gen_uuid
        nn = sprintf("%032X",rand(340282366920938463463374607431768211456).abs)
        nn = nn[0,8]+"-"+nn[12,4]+"-4"+nn[17,3]+"-"+["8","9","A","B"].shuffle[0]+nn[21,3]+"-"+nn[24,12]
    end

  end #class


end #module 
