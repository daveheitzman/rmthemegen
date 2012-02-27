#**********************************************************************
#*                                                                    *
#*  RmThemeGen - a ruby script to create random, usable themes for    *
#*  text editors. Currently supports RubyMine 3.X.X                   *
#*                                                                    *
#*  By David Heitzman, 2011                                           *
#*                                                                    *
#**********************************************************************

require 'rubygems'
require 'color'
require 'xmlsimple'
#require 'textpow'
#require 'uv'                    #ultraviolet
require 'plist'
require File.dirname(__FILE__)+"/token_list"
require File.dirname(__FILE__)+'/rgb_contrast_methods'
require File.dirname(__FILE__)+'/rmthemegen_to_css'
require File.dirname(__FILE__)+'/uv_addons.rb'
require File.dirname(__FILE__)+'/plist_to_tokenlist'


module RMThemeGen
  class  RMThemeParent
   attr_accessor :themename
   
    def initialize
    
    @theme_successfully_created = false

    @iterations = 1 
    @iterations = ARGV[0].to_s.to_i if ARGV[0]
      #bold:                  <option name="FONT_TYPE" value="1" />
      #italic:                <option name="FONT_TYPE" value="2" />
      #bold & italic:         <option name="FONT_TYPE" value="3" />
      

      @min_bright = 0.0
      @max_bright =  1.0

      #	if we avoid any notion of "brightness", which is an absolute quality, then we
      # can make our background any color we want, then adjust contrast to taste
      #tighter contrast spec

      #with the contrast-determining functions we actually have available, 0.3 is actually quite high, near
      # the 80th percentile or so. FYI
      
      @min_cont = 0.30	
      @max_cont = 1.0
      
      @themeversion = 1
      @themename = ''
      @background_max_brightness = 0.14
      @background_min_brightness = 0.65
      @background_grey = true #if false, allows background to be any color, as long as it meets brightness parameter
      @background_color_styles = [:dark,:light,:any]
      
      @bg_color_style = @background_color_styles[0] #0 = dark 1 = light (whitish), 2 = any color
    #  @foreground_min_brightness = 0.4

      @document_globals = {}
      @backgroundcolor = randcolor( :shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness)# "0"
      @textmate_hash = {}
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
    end

    def clean_colorsets
      # trim each color set down to at most 2 colors 
      if @color_sets.size > 0 
      ncs = []
        @color_sets.each  do |cs|
            while cs.size > 3 do
              cs.delete(cs.keys[0])              
            end
            ncs << cs
        end
      @color_sets = ncs
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
            :shade_of_grey => false} #forces r == g == b
      df = df.merge opts  
      df[:bg_rgb] = Color::RGB.from_html(df[:bg_rgb]) if df[:bg_rgb]
      color = brightok = contok = nil;
      cr=Color::RGB.new
      #failsafe should make sure the program never hangs trying to create 
      # a random color. 
      failsafe=200
      failsafe_mid = (failsafe/2).to_i
      usecolorsets = (!@color_sets.nil? && @color_sets != []) 
      
      last_contrast = this_contrast = nil
      best_color_yet = nil
      contok = true # this will only get switched off if there is a background color submitted 
      contrast_mid = ( (df[:min_cont] + df[:max_cont]) / 2.0 ).abs
      while (!color || !brightok || !contok && failsafe > 0) do
        if df[:shade_of_grey] == true 
          g = b = r = rand*256   
        elsif  usecolorsets && failsafe > failsafe_mid 
          cs = @color_sets.shuffle[0] 
          if cs.keys.include? :r then r = cr.next_gaussian( cs[:r])*256 else r = (df[:r] || rand*256)%256 end 
          if cs.keys.include? :g then g = cr.next_gaussian( cs[:g])*256 else g = (df[:g] || rand*256)%256 end 
          if cs.keys.include? :b then b = cr.next_gaussian( cs[:b])*256 else b = (df[:b] || rand*256)%256 end 
        else
          r = (df[:r] || rand*256)%256 #mod for robustness 
          g = (df[:g] || rand*256)%256
          b = (df[:b] || rand*256)%256
        end
        
        color = Color::RGB.new(r,g,b)
        best_color_yet ||= color
        
        if (df[:bg_rgb]) then 
          this_contrast = color.contrast(df[:bg_rgb]) 
          last_contrast ||= this_contrast 
          best_color_yet = (this_contrast - contrast_mid).abs < (last_contrast - contrast_mid ).abs ? color : best_color_yet
          contok = (df[:min_cont]..df[:max_cont]).include?( this_contrast )
        end
        brightok =  (df[:min_bright]..df[:max_bright]).include?( color.to_hsl.brightness )  
        
      failsafe -= 1
      end #while

      cn= failsafe <= 0 ? best_color_yet.html : color.html
      cn= cn.slice(1,cn.size)

      return cn
    end
    
   def handle_rand_seed(rand_seed=nil)
      if rand_seed then
        #if a random seed is given, we need to reset the colorsets and bgstyle according to random numbers created AFTER the generator is seeded, forsaking whatever came in as parameters, since they are irrelevant if the desire is to recreate a previous theme from a random number seed
        Kernel.srand(rand_seed) 
        @random_seed=rand_seed
        bg_color_style=rand(@background_color_styles.size).to_i
        reset_colorsets
      else
      #the reason we want the native seed used by this ruby implementation is that creating one ourselves might be erroneous in not using enough bits, or otherwise being insufficiently entropic. There is a "formula" used by MRI but we don't know what it is, so we'll just harvest the number from a fresh call to srand, then reseed the rng using that number. 
        Kernel.srand
        @random_seed = Kernel.srand #this sets @random_seed to the value used in the call above
        Kernel.srand(@random_seed)
      end
   end #def handle_rand_seed 

   def before_create(outputdir = ENV["PWD"], bg_color_style=:dark, colorsets=[], rand_seed=nil)
      defaults = {}
      defaults[:outputdir] = outputdir
      defaults[:bg_color_style] = bg_color_style
      opts = defaults
      @opts = opts
      @bg_color_style = opts[:bg_color_style]  
      @background_grey = ([:dark, :light].include? opts[:bg_color_style] ) #whitish or blackish bg are both "grey" 
      
      if colorsets.is_a?(Array) && colorsets.size > 0
        @color_sets = colorsets 
        clean_colorsets
      else
        reset_colorsets
      end
      
      case opts[:bg_color_style]
        when :dark #blackish background
          @background_min_brightness = 0.0 
          @background_max_brightness = 0.14 
        when :light #whitish background
          @background_min_brightness = 0.75 
          @background_max_brightness = 1.0 
        when :any #colored (any) bg
          @background_min_brightness = 0.0 
          @background_max_brightness = 1.0 
      end
      @backgroundcolor= randcolor(:shade_of_grey=>@background_grey, :max_bright=>@background_max_brightness,
        :min_bright => @background_min_brightness )# "0"
      @document_globals[:backgroundcolor] = @backgroundcolor
      @themename = randthemename
    end #before_create

   end #class
end #module
