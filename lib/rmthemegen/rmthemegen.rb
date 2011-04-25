#loads color info from Rubymine .xml color files

require 'xmlsimple'
#require File.dirname(__FILE__)+'/color/lib/color'
require 'color'
require File.dirname(__FILE__)+"/token_list"

module ColorThemeGen

  class ReadRMcolor
    
    attr_reader :xmlout #a huge structure of xml that can be given to XmlSimple.xml_out() to create that actual color theme file
      
    def initialize
    @rand = Random.new
	puts @@adjectives.size * @@nouns.size  
=begin
  #for testing purposes of the RGB contrast evaluator
    f = File.open("index.html","w+")
    st1="<html>"
    100.times do 
      begin 
        grkcol = Color::RGB.new(@rand.rand*255,@rand.rand*256,@rand.rand*256)
        brkcol = Color::RGB.new(@rand.rand*255,@rand.rand*256,@rand.rand*256)
        #puts grkcol.contrast(brkcol)
      end until grkcol.contrast(brkcol) > 0.20
      st1 += "<p style='background-color:#{grkcol.html};color:#{brkcol.html};'>aBD9 #!#$87 asf asdf werpl  09890 asd78coiuqwe rasdu 987zxcv klj;lcv "
      st1 += "<span style='background-color:#ffffff;color:#000000;'>hue/lum/bri/all: #{(100*grkcol.diff_hue(brkcol)).to_i}/#{(100*grkcol.diff_lum(brkcol)).to_i}/#{(100*grkcol.diff_bri(brkcol)).to_i}/#{(100*grkcol.contrast(brkcol)).to_i}</p>"
      grkcol = Color::RGB.new(0xf1,0x11,0x9a)
      brkcol = Color::RGB.new(0xa0,0xf4,0x2f)
      st1 += "<p style='background-color:#{grkcol.html};color:#{brkcol.html};'>aBD9 #!#$87 asf asdf werpl  09890 asd78coiuqwe rasdu 987zxcv klj;lcv "
      st1 += "<span style='background-color:#ffffff;color:#000000;'>hue/lum/bri/all: #{(100*grkcol.diff_hue(brkcol)).to_i}/#{(100*grkcol.diff_lum(brkcol)).to_i}/#{(100*grkcol.diff_bri(brkcol)).to_i}/#{(100*grkcol.contrast(brkcol)).to_i}</p>"
      grkcol = Color::RGB.new(0x42,0x08,0x11)
      brkcol = Color::RGB.new(0x48,0x19,0xd0)
      st1 += "<p style='background-color:#{grkcol.html};color:#{brkcol.html};'>aBD9 #!#$87 asf asdf werpl  09890 asd78coiuqwe rasdu 987zxcv klj;lcv "
      st1 += "<span style='background-color:#ffffff;color:#000000;'>hue/lum/bri/all: #{(100*grkcol.diff_hue(brkcol)).to_i}/#{(100*grkcol.diff_lum(brkcol)).to_i}/#{(100*grkcol.diff_bri(brkcol)).to_i}/#{(100*grkcol.contrast(brkcol)).to_i}</p>"
    end 
    st1+="</html>"
    printf(f,st1)
    f.close
=end

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
      @italic_candidates = ["STRING"]
      
      @bold_candidates = ["KEYWORD","RUBY_SPECIFIC_CALL", "CONSTANT", "COMMENT", "COMMA", "PAREN"]
# with code inspections we don't color the text, we just put a line or something under it .
      @code_inspections = ["ERROR","WARNING_ATTRIBUTES","DEPRECATED", "TYPO","WARNING_ATTRIBUTES", "BAD_CHARACTER",
      "CUSTOM_INVALID_STRING_ESCAPE_ATTRIBUTES","ERRORS_ATTRIBUTES"]
      @cross_out = ["DEPRECATED_ATTRIBUTES" ]
      
      @unders = %w(-1 0 1 2 5  )
      @underline_candidates = ["STRING"]
      @italic_chance = 0.5
      @bold_chance = 0.7
      @underline_chance = 0.3
#      @loadfile = "stellar.xml"
#      @schemename = "Efficient Wasteland"
      @bright_median = 0.85
        @min_bright = @bright_median * 0.65
        @max_bright =  [@bright_median * 1.35,1.0].max 
      @schemeversion = 1
      @background_max_brightness = 0.16
      @background_grey = true #if false, allows background to be any color, as long as it meets brightness parameter
      @foreground_min_brightness = 0.4
      @min_cont = 0.25


      @backgroundcolor= randcolor(:shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness)# "0"
      
    end 
    
    def randthemename
      out = " "
      while out.include? " "   do 
       out = @@adjectives[@rand.rand * @@adjectives.size]+"_"+@@nouns[@rand.rand * @@nouns.size]
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
            :min_cont  => 0.0, #if a backrgb (background color)  is supplied this will be used to create a minimum contrast with it.
            :max_cont => 1.0,
            :max_bright => 1.0,
            :min_bright => 0.0,
          #  :bright_median => 0.5,
            :shade_of_grey => false} #forces r == g == b
      df = df.merge opts  
      df[:bg_rgb] = Color::RGB.from_html(df[:bg_rgb]) if df[:bg_rgb]
      color = brightok = contok = nil;
      while (!color || !brightok || !contok ) do
        r = (df[:r] || @rand.rand*256)%256 #mod for robustness 
        g = (df[:g] || @rand.rand*256)%256
        b = (df[:b] || @rand.rand*256)%256
        g = b = r if df[:shade_of_grey] == true
        color = Color::RGB.new(r,g,b)
#        puts "color "+color.html
#        puts "contrast "+color.contrast(df[:bg_rgb]).to_s if df[:bg_rgb]
        bright = 
        contok = df[:bg_rgb] ? (df[:min_cont]..df[:max_cont]).cover?( color.contrast(df[:bg_rgb]) ) : true
#        puts "contok "+contok.to_s
        brightok = (df[:min_bright]..df[:max_bright]).cover?( color.to_hsl.brightness )  
#        puts "brightok "+brightok.to_s
      end 
  
      cn = color.html
      cn= cn.slice(1,cn.size)
      return cn
    end
    
    def set_doc_colors
      newopt = []
      @@doc_color_keys.each do |o|
        if o == "CARET_ROW_COLOR" then
          @caret_row_color = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.04,:max_cont => 0.06,:shade_of_grey=>false)
          newopt << {:name=> o, :value => @caret_row_color }
        elsif o.include?("SELECTION_BACKGROUND") then
          @selection_background = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.07,:max_cont => 0.09,:shade_of_grey=>false)
          newopt << {:name=> o, :value => @selection_background }
        else
#        puts "bgc"+@backgroundcolor
          newopt << {:name=> o, :value => randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont,:max_bright=>0.5,:min_bright=>0.3,:shade_of_grey=>@background_grey).to_s }
        end 
      end
      
      @xmlout[:scheme][0][:colors][0][:option] = newopt
      #Kernel.exit
    end
    
    def set_doc_options
      newopt = []
      newopt << {:name => "LINE_SPACING",:value=>'1.3' } #:value=>'1.3' works all right 
      newopt << {:name => "EDITOR_FONT_SIZE",:value => "14"} #:value = "14" is a safe default if you want to specify something
      newopt << {:name => "EDITOR_FONT_NAME" }
    
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
            fonttype = 1
          end 
        end 
        @italic_candidates.each do |ic|
          if o.include? ic.to_s then 
            fonttype += 2
          end 
        end 
        #this block is for setting up special cases for the new color - ie, comments darker,
        #reserved words are yellowins, whatever 
        fonttype = "" unless fonttype.is_a? Fixnum
        case 
          when o.include?( "COMMENT") 
      #comments -- this is done so that COMMENTED texts skew toward darker shades. 
            newcol = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_cont => @min_cont*1.2, :min_cont=>@min_cont ) 
            optblj=[{:option=>[ {:name => "FOREGROUND", :value => newcol},     
#           {:name => "BACKGROUND", :value =>@backgroundcolor},
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR" },{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright )}]}] 
       #default text and background for whole document
          when ["TEXT","FOLDED_TEXT_ATTRIBUTES"].include?( o.to_s)  
            newcol = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright ) 
            optblj=[{:option=>[ {:name => "FOREGROUND", :value => newcol},     
            {:name => "BACKGROUND", :value =>@backgroundcolor},
            {:name => "EFFECT_COLOR" },{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright )}]}] 
          when @code_inspections.include?(o.to_s)  
            newcol = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright ) 
            optblj=[{:option=>[ {:name => "FOREGROUND"},     
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR", :value =>newcol},{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "EFFECT_TYPE", :value=>@unders.shuffle[0].to_s },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright )}]}] 
          when @cross_out.include?(o.to_s)
            newcol = randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright ) 
            optblj=[{:option=>[ {:name => "FOREGROUND"},     
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR", :value =>newcol},{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "EFFECT_TYPE", :value=>"3" },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright )}]}] 
          else
            newcol=randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright ) 
            optblj=[{:option=>[ {:name => "FOREGROUND", :value => newcol},     
            {:name => "BACKGROUND"},
            {:name => "EFFECT_COLOR" },{:name => "FONT_TYPE", :value=>fonttype.to_s },
            {:name => "ERROR_STRIPE_COLOR", :value =>randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>@min_cont,:max_bright => @max_bright, :min_bright=>@min_bright )}]}] 
        end
        newopt[0][:option] << {:name =>o.to_s , :value=>optblj}
      end
      @xmlout[:scheme][0][:attributes] = newopt
    end 
  
    def make_theme_file
#      @default_fg = @backgroundcolor
#      puts "backgroundcolor = "+@backgroundcolor
      @schemename = randthemename
      @xmlout = {:scheme=>
                [{:name => @schemename,:version=>@schemeversion,:parent_scheme=>"Default",
                  :option =>[{:name=>"pencil length",:value=>"48 cm"},{:name => "Doowop level", :value=>"medium"}],
                  :colors => [{ :option => [{:name=>"foreground",:value => "yellow"},{:name=>"background",:value => "black"} ] }],
                  :attributes => [{:option=>[
                                  {:name=>"2ABSTRACT_CLASS_NAME_ATTRIBUTES", :value=>[{:option=>{:name=>"foreground",:value=>"red"}}] },
                                  {:name=>"4ABSTRACT_CLASS_NAME_ATTRIBUTES", :value=>[{:option=>{:name=>"foreground",:value=>"red"}}] }
                                  ] 
                                 }]
                }]
                }
  
      @savefile = randfilename(@schemename)
      begin
        @outf = File.new(@savefile, "w+")
      rescue
      end 

      set_doc_options
      set_doc_colors
      set_element_colors
      XmlSimple.xml_out(@xmlout,{:keeproot=>true,:xmldeclaration=>true,:outputfile=> @outf, :rootname => "scheme"})
      puts "outputting to file "+@savefile
    end
    
  
  end #class
end #module 

l = ColorThemeGen::ReadRMcolor.new
5.times do 
  l.make_theme_file
end
