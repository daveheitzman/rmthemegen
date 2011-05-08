require 'xmlsimple'
require 'color'
require File.dirname(__FILE__)+"/token_list"
require File.dirname(__FILE__)+'/rgb_contrast_methods'

module RMThemeGen
  class ThemeGenerator < RMThemeParent
    
    attr_reader :xmlout #a huge structure of xml that can be given to XmlSimple.xml_out() to create that actual color theme file
      
    def initialize
    
    @iterations = 0
    @iterations = ARGV[0].to_s.to_i
    
    puts "rgb_contrast methods -- this should create an index.html that displays samples of text and their contrast rating by the methods in contrast_methods "
    
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
      while (!color || !brightok || !contok ) do
        r = (df[:r] || rand*256)%256 #mod for robustness 
        g = (df[:g] || rand*256)%256
        b = (df[:b] || rand*256)%256
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
  end #class
end #module 

l = RMThemeGen::ThemeGenerator.new
