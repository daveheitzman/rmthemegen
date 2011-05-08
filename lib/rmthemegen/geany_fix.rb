require 'rubygems'
require 'xmlsimple'
require 'color'
require File.dirname(__FILE__)+"/token_list"
require File.dirname(__FILE__)+'/rgb_contrast_methods'

module RMThemeGen
  class GeanyFixer < RMThemeParent

    attr_reader :xmlout #a huge structure of xml that can be given to XmlSimple.xml_out() to create that actual color theme file

    def initialize
    @rand = Random.new
    @iterations = 0
    @iterations = ARGV[0].to_s.to_i

    puts "geany_fix - puts a new (random) color theme into your geany directory"
    puts "  David Heitzman 2011 "
    puts "  Note: if you want to put back your old Geany colors, go to ~/.config/geany/filedefs/ and"
    puts "  copy the corresponding _old_xxx file back onto filetypes.xyz, eg. filetypes.html, etc. "
    puts "  Restart geany to see new colors  "
  
    begin
    @dir = (File.expand_path "~/.config/geany/filedefs/")+"/"
    @filelist = Dir.glob(@dir+"filetypes.*")
#  puts @dir+"filetypes.*"
#    puts @filelist.inspect
    t =Time.now
    @extstring = t.year.to_s+t.month.to_s+t.day.to_s+t.sec.to_s
#    rescue
 #     raise "Sorry. There was trouble accessing the files in " + @dir
    end


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
      @min_cont = 0.32
      @max_cont = 1.0

      @schemeversion = 1
      @background_max_brightness = 0.16
      @background_grey = true #if false, allows background to be any color, as long as it meets brightness parameter
    #  @foreground_min_brightness = 0.4


      @backgroundcolor= randcolor( :shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness)# "0"

    end #initialize

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

    def go_fix_geany
      #goes into the geany directory and kicks some ass. it replaces every single color definition with
      #something random, of course with a consistent background. 

      @filelist.each do |f|
        begin
#          puts f+" -->"+@dir+"_old_"+@extstring+File.basename(f)
          IO.copy_stream(f,@dir+"_old_"+@extstring+File.basename(f))
     ##   rescue
      #    raise "sorry there was a problem backing up the following file: "+f
        end
      end

      @filelist.each do |f|
  #      puts f.inspect
        @fin = File.open(f,"r+")
        @fout = File.open("/tmp/gean"+Time.new().nsec.to_s,"w+")
  #      puts @fin.inspect

        while !@fin.eof? do
          curpos = @fin.pos
          line  = @fin.readline
          if line[0] != "#" && line.include?("=") && line.include?("0x") then
           # go in and root out the color and give it a new one.
#            puts "here is the line I'm working on -- "
#            puts line
            r1 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont, :max_cont=>@max_cont).upcase
            r2 = @backgroundcolor.upcase
            token = line.split("=")[0]
            p3 = line.split(";")[2] || "false"
            p4 = line.split(";")[3] || "false"
            case File.basename(f)
              when  "filetypes.common"
                if    token == "marker_search" then
                  r9 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.35, :max_cont=>@max_cont).upcase
                  newl = token +"="+"0x"+r1+";0x"+r9+";true;true"
                elsif token == "caret"  then
                  r9 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.35, :max_cont=>@max_cont).upcase
                  newl = token +"="+"0xFFFFFF;0x"+r9+";"+p3+";"+p4
                elsif token == "current_line" then
                  r9 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont*0.15, :max_cont=>@min_cont*0.3).upcase
                  newl = token +"="+"0x"+r1+";0x"+r9+";"+"true"+";"+"false"
                elsif token == "selection" then
                  r9 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont*0.25, :max_cont=>@min_cont*0.5).upcase
                  newl = token +"="+"0x"+r1+";0x"+r9+";"+"false"+";"+"true"
                elsif token == "brace_good" then
                  rb = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>0.25, :max_cont=>@max_cont).upcase
                  rf = randcolor(:bg_rgb=>rb, :min_cont=>0.30, :max_cont=>1.0).upcase
                  newl = token +"="+"0x"+rf+";0x"+rb+";"+"true"+";"+"false"
                elsif token == "brace_bad" then
                  rb = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont, :max_cont=>1.0).upcase
                  rf = randcolor(:bg_rgb=>rb, :min_cont=>0.30, :max_cont=>1.0).upcase
                  newl = token +"="+"0x"+rf+";0x"+rb+";"+"true"+";"+"false"
                else
                  newl = token +"="+"0x"+r1+";0x"+r2+";"+p3+";"+p4
                end

              when "filetypes.xml"
                  newl = token +"="+"0x"+r1+";0x"+r2+";"+p3+";"+p4

              when "filetypes.ruby"
                if token=="default" then
                  r3 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont, :max_cont=>@max_cont).upcase
                  #for whatever reason this needs to go in there in a ruby file : pod=0x388afb;0x131313;false;false
                  newl = token +"="+"0x"+r1+";0x"+r2+";"+p3+";"+p4+"\npod=0x#{r3};0x#{@backgroundcolor};false;false"
                elsif token.include?("comment") then
                  r1 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont*0.87, :max_cont=>@min_cont*0.95).upcase
                  r2 = @backgroundcolor.upcase
                  newl = token +"="+"0x"+r1+";0x"+r2+";"+p3+";"+p4
                else
                  newl = token +"="+"0x"+r1+";0x"+r2+";"+p3+";"+p4
                end
              else
                if token.include?("comment") then
                  r1 = randcolor(:bg_rgb=>@backgroundcolor, :min_cont=>@min_cont*0.33, :max_cont=>@min_cont*0.64).upcase
                  r2 = @backgroundcolor.upcase
                  newl = token +"="+"0x"+r1+";0x"+r2+";"+p3+";"+p4
                else
                  newl = token +"="+"0x"+r1+";0x"+r2+";"+p3+";"+p4
                end
            end
            @fout.puts(newl)
 #           puts newl
  #r2= randcolor(:back_rgb=>@backgroundcolor, :min_cont=>@min_cont, :max_cont=>@max_cont)
  #newl = line.sub(/\=0x*\;/,"=0x"+r1+";")
          else
            @fout.puts(line)
          end
        end
        if @fout then
          File.delete(File.absolute_path @fin)
          File.rename(File.absolute_path(@fout), @dir+File.basename(f) )
        else puts "there was a problem writing to the new file so I left the old one in place"
        end
        @fout.close
      end
    end
  end #class
end #module

l = RMThemeGen::GeanyFixer.new
l.go_fix_geany
