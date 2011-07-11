#**********************************************************************
#*                                                                    *
#*  RmThemeGen - a ruby script to create random, usable themes for    *
#*  text editors. Currently supports RubyMine 3.X.X                   *
#*                                                                    *
#*  By David Heitzman, 2011                                           *
#*                                                                    *
#**********************************************************************

#this is a version of the software that should work with ruby 1.8.7
#originally it was written and tested for ruby 1.9.2



require 'rubygems'
require 'color'
require 'xmlsimple'
require File.dirname(__FILE__)+"/token_list"
require File.dirname(__FILE__)+'/rgb_contrast_methods'
require File.dirname(__FILE__)+'/rmthemegen_to_css'

module RMThemeGen

  class ThemeGenerator < RMThemeParent
    
    attr_reader :xml_save, :themename 
    attr_reader :xmlout #a huge structure of xml that can be given to XmlSimple.xml_out() to create that actual color theme file
    
    def initialize
    @random_seed = Kernel.srand
    Kernel.srand(@random_seed)
    
    @theme_successfully_created = false

    @iterations = 1 
    @iterations = ARGV[0].to_s.to_i if ARGV[0]
      #bold:                  <option name="FONT_TYPE" value="1" />
      #italic:                <option name="FONT_TYPE" value="2" />
      #bold & italic:         <option name="FONT_TYPE" value="3" />
      
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
      @italic_candidates = ["STRING", "SYMBOL", "REQUIRE"]
      
      @bold_candidates = ["KEYWORD","RUBY_SPECIFIC_CALL", "CONSTANT", "COMMA", "PAREN","RUBY_ATTR_ACCESSOR_CALL", "RUBY_ATTR_READER_CALL" ,"RUBY_ATTR_WRITER_CALL", "IDENTIFIER"]
# with code inspections we don't color the text, we just put a line or something under it .
      @code_inspections = ["ERROR","WARNING_ATTRIBUTES","DEPRECATED", "TYPO","WARNING_ATTRIBUTES", "BAD_CHARACTER",
      "CUSTOM_INVALID_STRING_ESCAPE_ATTRIBUTES","ERRORS_ATTRIBUTES", "MATCHED_BRACE_ATTRIBUTES"]
      @cross_out = ["DEPRECATED_ATTRIBUTES" ]
      
      @unders = %w(-1 0 1 2 5  )
      @underline_candidates = ["STRING"]
      @italic_chance = 0.2
      @bold_chance = 0.4
      @underline_chance = 0.3

      @min_bright = 0.0
      @max_bright =  1.0

      #	if we avoid any notion of "brightness", which is an absolute quality, then we
      # can make our background any color we want, then adjust contrast to taste
      
      #tighter contrast spec
      @cont_median = 0.85
      @min_cont = @cont_median * 0.65
      @max_cont =  [@cont_median * 1.35,1.0].max
      
      #broad contrast spec
      @min_cont = 0.30	
      @max_cont = 1.0
      
      @themeversion = 1
      @themename = ''
      @background_max_brightness = 0.14
      @background_min_brightness = 0.65
      @background_grey = true #if false, allows background to be any color, as long as it meets brightness parameter
      @bg_color_style = 0 #0 = grey/dark 1 = grey/light (whitish), 2 = any color
    #  @foreground_min_brightness = 0.4

      
      @backgroundcolor= randcolor( :shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness)# "0"

      reset_colorsets
    end #def initialize 


    def reset_colorsets()
      #color sets: add to the variable @color_sets a hash containing 1 or 2 values in [0..1), indicating a shade 
      # of red or green that the random colors will interpolate around.  
      # if anything exists in @color_sets, the program will, when choosing its next random color, grab a random
      # color set, and then the next random color value produced will have up to 2 of its components (r, g, or b) 
      # chosen with the specified r,g, or b as the median for a random gaussian, which will of course be limited
      # to the range [0..1)

      @color_sets = []
      (rand*4).to_i.times { 
        @color_set = {}
        3.times do
         case 
           when rand < 0.333 then @color_set[:r] = rand
           when rand < 0.666 then @color_set[:g] = rand
           else @color_set[:b] = rand
          end
        end #8times
          @color_sets << @color_set
       } #rand*4times    
#      @color_set = {:b => rand, :g=>rand, :r => rand}
#      @color_sets << @color_set
#     puts @color_sets.inspect
    end

    def clean_colorsets
      # trim each color set down to at most 2 colors 
      if @color_sets.size > 0 
      ncs = []
#      puts @color_sets.inspect
        @color_sets.each  do |cs|
            while cs.size > 3 do
              cs.delete(cs.keys[0])              
            end
            ncs << cs
        end
      @color_sets = ncs
#      puts "@color_sets "+@color_sets.to_s  
      end     
    end
    
    def clear_colorsets
      @color_sets=[]
    end
    
    def randthemename
      out = " "
      while out.include? " "   do 
       out = @@adjectives[rand * @@adjectives.size]+"_"+@@nouns[rand * @@nouns.size]
      end 
      return out
    end
    
    def randfilename(existing = "")
     if existing != "" then
      out=existing
     else
      ar=["a","b","f","h","z","1","5"]
      ar.shuffle! 
      out =""
      ar.each { |n|
        out << n
      }
     end
     return "rmt_"+out+".xml"
    end
    
    
    def randcolor(opts={})
      df= { :r=>nil, :g=>nil, :b=>nil, #these are the usual 0..255 
            :bg_rgb => nil,
            :min_cont  => @min_cont, #if a backrgb (background color)  is supplied this will be used to create a minimum contrast with it.
            :max_cont => @max_cont,
            :max_bright => @max_bright,
            :min_bright => @min_bright,
          #  :bright_median => 0.5,
            :shade_of_grey => false} #forces r == g == b
      df = df.merge opts  
      df[:bg_rgb] = Color::RGB.from_html(df[:bg_rgb]) if df[:bg_rgb]
      color = brightok = contok = nil;
      cr=Color::RGB.new
      #failsafe should make sure the program never hangs trying to create 
      # a random color. 
      failsafe=20000
      usecolorsets = (!@color_sets.nil? && @color_sets != []) 
      while (!color || !brightok || !contok && failsafe > 0) do
        if df[:shade_of_grey] == true 
          g = b = r = rand*256   
        elsif  usecolorsets && failsafe > 10000
          cs = @color_sets.shuffle[0] 
 #puts "doing gaussian thing "+cs.inspect
          if cs.keys.include? :r then r = cr.next_gaussian( cs[:r])*256 else r = (df[:r] || rand*256)%256 end 
          if cs.keys.include? :g then g = cr.next_gaussian( cs[:g])*256 else g = (df[:g] || rand*256)%256 end 
          if cs.keys.include? :b then b = cr.next_gaussian( cs[:b])*256 else b = (df[:b] || rand*256)%256 end 
        else
          r = (df[:r] || rand*256)%256 #mod for robustness 
          g = (df[:g] || rand*256)%256
          b = (df[:b] || rand*256)%256
        end
        
        color = Color::RGB.new(r,g,b)
  #      puts color.inspect
  #puts "bg" + @backgroundcolor if df[:bg_rgb]
  #puts "color "+color.html
  #puts "contrast "+color.contrast(df[:bg_rgb]).to_s if df[:bg_rgb]
        contok = df[:bg_rgb] ? (df[:min_cont]..df[:max_cont]).include?( color.contrast(df[:bg_rgb]) ) : true
  #puts "contok "+contok.to_s
        brightok =  (df[:min_bright]..df[:max_bright]).include?( color.to_hsl.brightness )  
        
  #puts "brightok "+brightok.to_s
      failsafe -= 1
#     if failsafe == 0 then puts "failsafe reached " end;
      end #while
      cn = color.html
      cn= cn.slice(1,cn.size)
      return cn
    end
    
    def set_doc_colors
      newopt = []
      @@doc_color_keys.each do |o|
        if o == "CARET_ROW_COLOR" then
          @caret_row_color = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.05,:max_cont => 0.08,:shade_of_grey=>false)
          newopt << {:name=> o, :value => @caret_row_color }
        elsif o.include?("SELECTION_BACKGROUND") then
          @selection_background = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.07,:max_cont => 0.09,:shade_of_grey=>false)
          newopt << {:name=> o, :value => @selection_background }
        elsif o.include?("SELECTION_FOREGROUND") then
          newopt << {:name=> o }
        elsif o.include?("GUTTER_BACKGROUND") then
          newopt << {:name=> o, :value => @backgroundcolor }
        elsif o.include?("CARET_COLOR") then
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.30,:max_cont=>0.7,:shade_of_grey=>true) }

        elsif o.include?("READONLY_BACKGROUND") then
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.03,:max_cont=>0.09,:shade_of_grey=>@background_grey) }
        elsif o.include?("READONLY_FRAGMENT_BACKGROUND") then
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.03,:max_cont=>0.09,:shade_of_grey=>@background_grey) }
        elsif o.include?("INDENT_GUIDE") then
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.08,:max_cont=>0.22,:shade_of_grey=>@background_grey) }
        else
#        puts "bgc"+@backgroundcolor
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont,:max_cont=>@max_cont,:shade_of_grey=>@background_grey).to_s }
        end 
      end
      
      @xmlout[:scheme][0][:colors][0][:option] = newopt
      #Kernel.exit
    end
    
    def set_doc_options
      newopt = []
      newopt << {:name => "LINE_SPACING",:value=>'1.0' } #:value=>'1.3' works all right 
      newopt << {:name => "EDITOR_FONT_SIZE",:value => "12"} #:value = "14" is a safe default if you want to specify something
      newopt << {:name => "EDITOR_FONT_NAME",:value => "DejaVu Sans Mono" }
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
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor)}]}] 
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
      end
      @xmlout[:scheme][0][:attributes] = newopt
    end 
  
    # (output directory, bg_color_style, colorsets []) 
    def make_theme_file(outputdir = ENV["PWD"], bg_color_style=0, colorsets=[], rand_seed=nil)
    #bg_color_style: 0 = blackish, 1 = whitish, 2 = any color
      @random_seed = rand_seed || Kernel.srand
      Kernel.srand(@random_seed) 
      @theme_successfully_created=false
      defaults = {}
      defaults[:outputdir] = outputdir
      defaults[:bg_color_style] = bg_color_style
      opts = defaults
      @opts = opts
      @bg_color_style = opts[:bg_color_style]  
      @background_grey = (opts[:bg_color_style] < 2) #whitish or blackish bg are both "grey" 
      
      if colorsets.is_a?(Array) && colorsets.size > 0
        @color_sets = colorsets 
        clean_colorsets
      else
        reset_colorsets
      end
      
#      puts "@color_sets: "+@color_sets.inspect
      case opts[:bg_color_style]
        when 0 #blackish background
          @background_min_brightness = 0.0 
          @background_max_brightness = 0.14 
        when 1 #whitish background
          @background_min_brightness = 0.75 
          @background_max_brightness = 1.0 
        when 2 #colored (any) bg
          @background_min_brightness = 0.0 
          @background_max_brightness = 1.0 
      end
      @backgroundcolor= randcolor(:shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness,
        :min_bright => @background_min_brightness )# "0"
      @themename = randthemename
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
        @outf = File.new(opts[:outputdir]+"/"+@savefile, "w+")
        set_element_colors
        set_doc_colors
        set_doc_options
        XmlSimple.xml_out(@xmlout,{:keeproot=>true,:xmldeclaration=>true,:outputfile=> @outf, :rootname => "scheme"})
        @outf.close	
        @theme_successfully_created = true
        return File.expand_path(@outf.path)
    end
  
  end #class
end #module 
