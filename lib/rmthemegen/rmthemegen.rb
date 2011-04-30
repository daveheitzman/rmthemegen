require 'xmlsimple'
require 'color'
require File.dirname(__FILE__)+"/token_list"
require File.dirname(__FILE__)+'/rgb_contrast_methods'

module ColorThemeGen

  class ReadRMcolor
    
    attr_reader :xmlout #a huge structure of xml that can be given to XmlSimple.xml_out() to create that actual color theme file
      
    def initialize
    @rand = Random.new
    
    @iterations = 0
    @iterations = ARGV[0].to_s.to_i
    
    puts "rmthemegen - creates theme files for use with rubymine (3.0.0 and up) "
    puts "by David Heitzman 2011 "
    puts (@@adjectives.size * @@nouns.size).to_s  + " possible theme names "
  
    puts "generating #{@iterations.to_s} themes into current directory. Filenames: rmt_xyz.xml "
    
=begin
  #for testing purposes of the RGB contrast evaluator
    f = File.open("index.html","w+")
    st1="<html>"
    h = Hash.new
    #generate histogram 
    0.times do 
      begin 
        grkcol = Color::RGB.new(@rand.rand*256,@rand.rand*256,@rand.rand*256)
        brkcol = Color::RGB.new(@rand.rand*256,@rand.rand*256,@rand.rand*256)
        #puts grkcol.contrast(brkcol)
      end until true# grkcol.contrast(brkcol) > 0.20
      key =(grkcol.contrast(brkcol)*100).to_i
      h[key] = h.has_key?(key) ? h[key] += 1 : 1
      
    end
    
    0.upto 0  do |f|
      st1 += "<p>"+f.to_s+": "+ ( h[f.to_i] ? h[f.to_i].to_s : "nada")+"</p>"
    
    end
    
    0.upto 255 do |i|
      begin 
#        grkcol = Color::RGB.new(@rand.rand*256,@rand.rand*256,@rand.rand*256)
#        brkcol = Color::RGB.new(@rand.rand*256,@rand.rand*256,@rand.rand*256)
        grkcol = Color::RGB.new(  0,0,0 )
        brkcol = Color::RGB.new(i,0,0)
        #puts grkcol.contrast(brkcol)
      end until true# grkcol.contrast(brkcol) > 0.20
      st1 += "<p style='padding:0;margin:0;background-color:#{grkcol.html};color:#{brkcol.html};'>aBD9 #!#$87 asf asdf werpl  09890 asd78coiuqwe rasdu 987zxcv klj;lcv "
      st1 += "<span style='padding:0;margin:0;background-color:#ffffff;color:#000000;'>hue/lum/bri/all: #{(100*grkcol.diff_hue(brkcol)).to_i}/#{(100*grkcol.diff_lum(brkcol)).to_i}/#{(100*grkcol.diff_bri(brkcol)).to_i}/#{(100*grkcol.contrast(brkcol)).to_i}</p>"
     # grkcol = Color::RGB.new(0xf1,0x11,0x9a)
     # brkcol = Color::RGB.new(0xa0,0xf4,0x2f)
     # st1 += "<p style='padding:0;margin:0;background-color:#{grkcol.html};color:#{brkcol.html};'>aBD9 #!#$87 asf asdf werpl  09890 asd78coiuqwe rasdu 987zxcv klj;lcv "
     # st1 += "<span style='padding:0;margin:0;background-color:#ffffff;color:#000000;'>hue/lum/bri/all: #{(100*grkcol.diff_hue(brkcol)).to_i}/#{(100*grkcol.diff_lum(brkcol)).to_i}/#{(100*grkcol.diff_bri(brkcol)).to_i}/#{(100*grkcol.contrast(brkcol)).to_i}</p>"
     # grkcol = Color::RGB.new(0x42,0x08,0x11)
     # brkcol = Color::RGB.new(0x48,0x19,0xd0)
     # st1 += "<p style='background-color:#{grkcol.html};color:#{brkcol.html};'>aBD9 #!#$87 asf asdf werpl  09890 asd78coiuqwe rasdu 987zxcv klj;lcv "
      #st1 += "<span style='background-color:#ffffff;color:#000000;'>hue/lum/bri/all: #{(100*grkcol.diff_hue(brkcol)).to_i}/#{(100*grkcol.diff_lum(brkcol)).to_i}/#{(100*grkcol.diff_bri(brkcol)).to_i}/#{(100*grkcol.contrast(brkcol)).to_i}</p>"
    end 
     
    st1+="</html>"
    printf(f,st1)
    f.close

Kernel.exit
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
      @bright_median = 0.85
        @min_bright = @bright_median * 0.65
        @max_bright =  [@bright_median * 1.35,1.0].max

        @min_bright = 0.0
        @max_bright =  1.0

      #	if we avoid any notion of "brightness", which is an absolute quality, then we
      # can make our background any color we want ! 
      
      #tighter contrast spec
      @cont_median = 0.85
        @min_cont = @cont_median * 0.65
        @max_cont =  [@cont_median * 1.35,1.0].max
      
      #broad contrast spec
      @min_cont = 0.30	
      @max_cont = 1.0
      
      @schemeversion = 1
      @background_max_brightness = 0.14
      @background_grey = true #if false, allows background to be any color, as long as it meets brightness parameter
    #  @foreground_min_brightness = 0.4


      @backgroundcolor= randcolor( :shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness)# "0"
      
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
            :min_cont  => @min_cont, #if a backrgb (background color)  is supplied this will be used to create a minimum contrast with it.
            :max_cont => @max_cont,
            :max_bright => @max_bright,
            :min_bright => @min_bright,
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
  #puts "bg" + @backgroundcolor if df[:bg_rgb]
  #puts "color "+color.html
  #puts "contrast "+color.contrast(df[:bg_rgb]).to_s if df[:bg_rgb]
        contok = df[:bg_rgb] ? (df[:min_cont]..df[:max_cont]).cover?( color.contrast(df[:bg_rgb]) ) : true
  #puts "contok "+contok.to_s
        brightok = (df[:min_bright]..df[:max_bright]).cover?( color.to_hsl.brightness )  
  #puts "brightok "+brightok.to_s
      end 
  
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
      newopt << {:name => "EDITOR_FONT_SIZE",:value => "16"} #:value = "14" is a safe default if you want to specify something
      newopt << {:name => "EDITOR_FONT_NAME",:value => "DejaVu Sans Mono" }
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
            if @rand.rand < @bold_chance then fonttype = 1 end
          end 
        end 
        @italic_candidates.each do |ic|
          if o.include? ic.to_s then 
            if @rand.rand < @italic_chance then fonttype += 2 end 
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
    
    def make_geany_files
      rantm = randthemename
      geanydir ="geany_"+rantm 
      Dir.mkdir(geanydir)
      f=File.new(geanydir+"/filetypes.xml","w+")
      f.puts('[styling]')
      #these are for php, html, sgml, xml
      @@geany_tokens.each do |t|
      # foreground;background;bold;italic
        if t.upcase.include? "COMMENT" then
          f.puts(t+"=0x"+randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.12, :max_cont=>0.22)+";0x"+@backgroundcolor+";"+"false;false")
          else
          f.puts(t+"=0x"+randcolor(:bg_rgb=>@backgroundcolor)+";0x"+@backgroundcolor+";false"+";false")
        end
      end
      f.puts(@@geany_filetypes_post)
      f.close
  
      geanydir ="geany_"+rantm 
      f=File.new(geanydir+"/filetypes.ruby","w+")
      f.puts('[styling]')
      @@geany_ruby_tokens.each do |t|
      # foreground;background;bold;italic
      if t.upcase.include? "COMMENT" then
        f.puts(t+"=0x"+randcolor(:bg_rgb=>@backgroundcolor,:min_cont=>0.12, :max_cont=>0.22)+";0x"+@backgroundcolor+";"+"false;false")
      else
              f.puts(t+"=0x"+randcolor(:bg_rgb=>@backgroundcolor)+";0x"+@backgroundcolor+";false"+";false")
      end
      end
      f.puts(@@geany_filetypes_post)
      f.close
    end
  
    def make_theme_files
#      @default_fg = @backgroundcolor
#      puts "backgroundcolor = "+@backgroundcolor
      @iterations.times do
        @backgroundcolor= randcolor(:shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness)# "0"
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
        @outf = File.new(@savefile, "w+")
  
	set_doc_options
	set_doc_colors
	set_element_colors
#	@outf.puts @@mybanner
  XmlSimple.xml_out(@xmlout,{:keeproot=>true,:xmldeclaration=>true,:outputfile=> @outf, :rootname => "scheme"})
	puts "outputting to file "+@savefile
	@outf.close	
	puts "making geany directory "+make_geany_files.to_s
      end 
    end
    
  
  end #class
end #module 

l = ColorThemeGen::ReadRMcolor.new
l.make_theme_files
