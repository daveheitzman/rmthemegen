#**********************************************************************
#*                                                                    *
#*  RmThemeGen - a ruby script to create random, usable themes for    *
#*  text editors. Currently supports RubyMine 3.X.X                   *
#*                                                                    *
#*  By David Heitzman, 2011                                           *
#*                                                                    *
#**********************************************************************

#this is a version of the software that should work with ruby 1.8.7



require File.dirname(__FILE__)+'/rmthemegen_parent'

module RMThemeGen

  class ThemeRubyMine < RMThemeParent
    
    attr_reader :xml_save 
    attr_reader :xmlout #a huge structure of xml that can be given to XmlSimple.xml_out() to create that actual color theme file
    
   def initialize
      super
      #"EFFECT-TYPE" s: 
      #   3 ==> cross-out 
      #   1 ==> underline
      #   2 == >squiggle underline
      #   5 => blockey underline 
      #   0 ==> box around word
      #   -1 ==> seems to have no effect

      # if the element name contains a string from the following arrays it makes that element
      # eligible for bold, italic or both. This allows elements from multiple languages to all
      # be exposed equally to 
      # underline not implemented yet. There are several font decorations in rubymine, 
      # probably should be used sparingly. 
      @bold_chance = 0.4
      @underline_chance = 0.3
      @italic_candidates = ["STRING", "SYMBOL", "REQUIRE"]
      @bold_candidates = ["KEYWORD","RUBY_SPECIFIC_CALL", "CONSTANT", "COMMA", "PAREN","RUBY_ATTR_ACCESSOR_CALL", "RUBY_ATTR_READER_CALL" ,"RUBY_ATTR_WRITER_CALL", "IDENTIFIER"]
# with code inspections we don't color the text, we just put a line or something under it .
      @code_inspections = ["ERROR","WARNING_ATTRIBUTES","DEPRECATED", "TYPO","WARNING_ATTRIBUTES", "BAD_CHARACTER",
      "CUSTOM_INVALID_STRING_ESCAPE_ATTRIBUTES","ERRORS_ATTRIBUTES", "MATCHED_BRACE_ATTRIBUTES"]
      @cross_out = ["DEPRECATED_ATTRIBUTES" ]
      
      @unders = %w(-1 0 1 2 5  )
      @underline_candidates = ["STRING"]
      @italic_chance = 0.2
   end
    
    def set_doc_colors
      newopt = []
      @@doc_color_keys.each do |o|
        if o == "CARET_ROW_COLOR" then
         @caret_row_color = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.05,:max_cont => 0.08,:shade_of_grey=>false)
          newopt << {:name=> o, :value => @caret_row_color }
          @document_globals[:CARET_ROW_COLOR] = @caret_row_color
        elsif o.include?("SELECTION_BACKGROUND") then
          @selection_background = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.07,:max_cont => 0.09,:shade_of_grey=>false)
          newopt << {:name=> o, :value => @selection_background }
          @document_globals[:SELECTION_BACKGROUND] = @selection_background
        elsif o.include?("SELECTION_FOREGROUND") then
          newopt << {:name=> o }
        elsif o.include?("GUTTER_BACKGROUND") then
          newopt << {:name=> o, :value => @backgroundcolor }
        elsif o.include?("CARET_COLOR") then
          newopt << {:name=> o, :value => (@caret_color = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.30,:max_cont=>0.7,:shade_of_grey=>true) )}
          @document_globals[:CARET_COLOR] = @caret_color
        elsif o.include?("READONLY_BACKGROUND") then
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.03,:max_cont=>0.09,:shade_of_grey=>@background_grey) }
        elsif o.include?("READONLY_FRAGMENT_BACKGROUND") then
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.03,:max_cont=>0.09,:shade_of_grey=>@background_grey) }
        elsif o.include?("INDENT_GUIDE") then
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.08,:max_cont=>0.22,:shade_of_grey=>@background_grey) }
        else
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont,:max_cont=>@max_cont,:shade_of_grey=>@background_grey).to_s }
        end 
      end
      
      @xmlout[:scheme][0][:colors][0][:option] = newopt
    end
    
    def set_doc_options
      newopt = []
      newopt << {:name => "LINE_SPACING",:value=>'1.0' } #:value=>'1.3' works all right 
      newopt << {:name => "EDITOR_FONT_NAME",:value => "DejaVu Sans Mono" }
      newopt << {:name => "EDITOR_FONT_SIZE",:value => "12"} #:value = "14" is a safe default if you want to specify something
      newopt << {:name => "RANDOM_SEED",:value => @random_seed.to_s }
      @xmlout[:scheme][0][:option] = newopt
    end
    
    def set_element_colors
      newopt = []
      newopt[0]={:option=>[]}
      ################      set the fonttype 
      @@element_keys.each do |o|
        fonttype = 0 #bold: 1,  #italic: 2, bold & italic: 3   
        @bold_candidates.each do |bc|
          if o.include? bc.to_s then 
            if rand < @bold_chance then fonttype = 1 end
          end 
        end 
        @italic_candidates.each do |ic|
          if o.include? ic.to_s then 
            if rand < @italic_chance then fonttype += 2 end 
          end 
        end 
        #this block is for setting up special cases for the new color - ie, comments darker,
        #reserved words are yellowins, whatever 
        fonttype = "" unless fonttype.is_a? Fixnum
        case 
          when o.include?( "COMMENT") 
      #comments -- this is done so that COMMENTED texts skew toward darker shades. 
            newcol = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.25, :max_cont => 0.27) 
            optblj=[{:option=>[ {:name => "FOREGROUND", :value => newcol},     
#           {:name => "BACKGROUND", :value =>@backgroundcolor},
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR" },{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor) }]}] 
       #default text and background for whole document
          when ["TEXT","FOLDED_TEXT_ATTRIBUTES"].include?( o.to_s)
            newcol = randcolor(:bg_rgb=>@backgroundcolor ) 
            optblj=[{:option=>[ {:name => "FOREGROUND", :value => newcol},     
            {:name => "BACKGROUND", :value =>@backgroundcolor},
            {:name => "EFFECT_COLOR" },{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "ERROR_STRIPE_COLOR", :value => (randcolor(:bg_rgb=>@backgroundcolor) ) }]}] 
            @document_globals[:TEXT] = newcol
          when @code_inspections.include?(o.to_s)  
            newcol = randcolor(:bg_rgb=>@backgroundcolor) 
            optblj=[{:option=>[ {:name => "FOREGROUND"},     
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR", :value =>newcol},{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "EFFECT_TYPE", :value=>@unders.shuffle[0].to_s },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor) }]}] 
          when @cross_out.include?(o.to_s)
            newcol = randcolor(:bg_rgb=>@backgroundcolor) 
            optblj=[{:option=>[ {:name => "FOREGROUND"},     
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR", :value =>newcol},{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "EFFECT_TYPE", :value=>"3" },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor)}]}] 
          else
            newcol=randcolor(:bg_rgb=>@backgroundcolor) 
            optblj=[{:option=>[ {:name => "FOREGROUND", :value => newcol},     
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR" },{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor) }]}] 
        end
        newopt[0][:option] << {:name =>o.to_s , :value=>optblj}
        tmphash = {}
        optblj[0][:option].each do |siing| 
          tmphash[ siing[:name].to_sym ] = siing[:value] 
        end 
        @textmate_hash[o.to_sym] = tmphash
      end
      
      @xmlout[:scheme][0][:attributes] = newopt
    end     
    
   def make_theme_file(outputdir = ENV["PWD"], bg_color_style=:dark, colorsets=[], rand_seed=nil)
      make_rm_theme_file(outputdir, bg_color_style, colorsets, rand_seed)
   end 
    
    # (output directory, bg_color_style, colorsets []) 
    def make_rm_theme_file(outputdir = ENV["PWD"], bg_color_style=:dark, colorsets=[], rand_seed=nil)
    #bg_color_style: 0 = blackish, 1 = whitish, 2 = any color, from #000000 to #FFFFFF
      handle_rand_seed(rand_seed)
      @theme_successfully_created=false
      before_create(outputdir, bg_color_style, colorsets, rand_seed)  
      @xmlout = {:scheme=>
                [{
                  :attributes => [{:option=>[
                                  {:name=>"2ABSTRACT_CLASS_NAME_ATTRIBUTES", :value=>[{:option=>{:name=>"foreground",:value=>"red"}}] },
                                  {:name=>"4ABSTRACT_CLASS_NAME_ATTRIBUTES", :value=>[{:option=>{:name=>"foreground",:value=>"red"}}] }
                                  ] 
                                 }],
                  :colors => [{ :option => [{:name=>"foreground",:value => "yellow"},{:name=>"background",:value => "black"} ],
                  :option =>[{:name=>"pencil length",:value=>"48 cm"},{:name => "Doowop level", :value=>"medium"}]
                   }],
                :name => @themename,:version=>@themeversion,:parent_scheme=>"Default", :author=>"David Heitzman, http://rmthemegen.com"
                }]
                }
        @savefile = randfilename(@themename)
        @outf = File.new(@opts[:outputdir]+"/"+@savefile, "w+")
        set_element_colors
        set_doc_colors
        set_doc_options
        XmlSimple.xml_out(@xmlout,{:keeproot=>true,:xmldeclaration=>true,:outputfile=> @outf, :rootname => "scheme"})
        @outf.close	
        @theme_successfully_created = true
        return File.expand_path(@outf.path)
    end
   
  end    #class
end #module 
