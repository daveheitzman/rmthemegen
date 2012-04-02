require 'rubygems'
require 'plist'
require 'textpow'

module Uv
   def Uv.foreground bg
      fg = "#FFFFFF"
      3.times do |i|
         fg = "#000000" if bg[i*2+1, 2].hex > 0xFF / 2 
      end
      fg
   end
   
   def Uv.alpha_blend bg, fg
      unless bg =~ /^#((\d|[ABCDEF]){3}|(\d|[ABCDEF]){6}|(\d|[ABCDEF]){8})$/i
         raise(ArgumentError, "Malformed background color '#{bg}'" )
      end
      unless fg =~ /^#((\d|[ABCDEF]){3}|(\d|[ABCDEF]){6}|(\d|[ABCDEF]){8})$/i
         raise(ArgumentError, "Malformed foreground color '#{fg}'" )
      end
      
      if bg.size == 4
         tbg =  (fg[1,1].hex * 0xff / 0xf).to_s(16).upcase.rjust(2, '0')
         tbg += (fg[2,1].hex * 0xff / 0xf).to_s(16).upcase.rjust(2, '0')
         tbg += (fg[3,1].hex * 0xff / 0xf).to_s(16).upcase.rjust(2, '0')
         bg = "##{tbg}"
      end
      
      result = ""
      if fg.size == 4
         result += (fg[1,1].hex * 0xff / 0xf).to_s(16).upcase.rjust(2, '0')
         result += (fg[2,1].hex * 0xff / 0xf).to_s(16).upcase.rjust(2, '0')
         result += (fg[3,1].hex * 0xff / 0xf).to_s(16).upcase.rjust(2, '0')
      elsif fg.size == 9
         if bg.size == 7
            div0 = bg[1..-1].hex
            div1, alpha = fg[1..-1].hex.divmod( 0x100 )
            3.times {      
               div0, mod0 = div0.divmod( 0x100 )
               div1, mod1 = div1.divmod( 0x100 )
               result = ((mod0 * alpha + mod1 * ( 0x100 - alpha ) ) / 0x100).to_s(16).upcase.rjust(2, '0') + result
            } 
         else
            div_a, alpha_a = bg[1..-1].hex.divmod( 0x100 )
            div_b, alpha_b = fg[1..-1].hex.divmod( 0x100 )
            alpha = alpha_a + alpha_b * (0x100 - alpha_a)
            3.times {
               div_b, c_b = div_b.divmod( 0x100 )
               div_a, c_a = div_a.divmod( 0x100 )
               result = ((c_a * alpha_a + ( 0x100 - alpha_a ) * alpha_b * c_b ) / alpha).to_s(16).upcase.rjust(2, '0') + result
            } 
         end
         #result = "FF00FF"
      else
         result = fg[1..-1]
      end
      "##{result}"
   end
   
   def Uv.normalize_color settings, color, fg = false
      if color
         if fg
            alpha_blend( settings["foreground"] ? settings["foreground"] : "#000000FF", color )
         else
            alpha_blend( settings["background"] ? settings["background"] : "#000000FF", color )
         end
      else
         color
      end
   end   

   def Uv.css_string(css,code_name)   
      #input: a hash of css selectors=>styles
      #output :usable css
     # added by david heitzman 
      outs='<style type="text/css">'
      css.each do |key, values|
         if key == code_name
            outs += "#{code_name} {"
         else
            outs += "#{code_name} #{key} {"
         end
         values.each do |style, value|
            outs += "   #{style}: #{value};" if value
         end
         outs += "} "
      end 
      outs += "</style>"
   end


   def Uv.get_render_and_css(tm_theme)
     # input: a string that a .tmTheme after being read with Plist::parse_xml
     # output: [{a hash containing the render data structure },{ a hash containing the  css string }]
     # added by david heitzman 

     settings = tm_theme["settings"].find { |s| ! s["name"] }["settings"]
   
         render = {"name" => tm_theme["name"]}
         css = {}

         standard_name = tm_theme["name"]
         code_name = "pre.#{standard_name}"

         render["tags"] = []
         count_names = {}
         tm_theme["settings"].each do |t|
            if t["scope"]
               class_name = t["name"].downcase.gsub(/\W/, ' ').gsub('.tmtheme', '').split(' ').collect{|s| s.capitalize}.join
               if class_name == ""
                  class_name = "x" * t["name"].size
               end
               
               if count_names[class_name]
                  tname = class_name
                  class_name = "#{class_name}#{count_names[class_name]}"
                  count_names[tname] += count_names[tname] + 1
               else
                  count_names[class_name] = 1
               end
               
               tag = {}
               tag["selector"] = t["scope"]
               tag["begin"] = "<span class=\"#{class_name}\">"
               tag["end"] = "</span>"
               render["tags"] << tag
               
               if s = t["settings"]
                  style = {}
                  style["color"] = Uv.normalize_color(settings, s["foreground"], true)
                  style["background-color"] = Uv.normalize_color(settings, s["background"])
                  case s["fontStyle"]
                     when /bold/ then style["font-weight"] = "bold"
                     when /italic/ then style["font-style"] = "italic"
                     when /underline/ then style["text-decoration"] = "underline"
                  end
                  css[".#{class_name}"] = style
               end
            elsif ! t["name"]
               if s = t["settings"]
                  style = {}
                  style["color"] = Uv.normalize_color(settings, s["foreground"], true)
                  style["background-color"] = Uv.alpha_blend(s["background"], s["background"])
                  css[code_name] = style
                  @style = style
                  style = {}
                  style["background-color"] = Uv.alpha_blend(s["selection"], s["selection"])
                  style["color"] = Uv.foreground( style["background-color"] )
                  css[".line-numbers"] = style
                  
                  tag = {}
                  tag["begin"] = "<span class=\"line-numbers\">"
                  tag["end"] = "</span>"
                  render["line-numbers"] = tag
               end
            end
         end

         render["filter"] = "CGI.escapeHTML( @escaped )"

         tag = {}
         tag["begin"] = ""
         tag["end"]   = ""
         render["line"] = tag


         tag = {}
         tag["begin"] = "<pre class=\"#{standard_name}\">"
         tag["end"]   = "</pre>"
         render["listing"] = tag

         tag = {}
         tag["begin"] = ''

         tag["end"] = ''

         render["document"] = tag
         return [render,css_string(css, code_name)]
   end 


   def Uv.tmtheme_to_html(tm_theme,code_to_render, options)

      #input: tm_theme        - a string containing an xml representation of a textmate theme in plist format 
      #input: code_to_render  - the code (ruby, php, python, c etc.) you want rendered as html 
      #input: options - a hash containing options such as line numbers, etc  :line_numbers => false, :render_style => "classic", :headers => false, :code_type=>nil
      #       They are the same options you can give to Uv.parse
      #output : [<css string>,<html string>]

      opts = {:line_numbers => false, :render_style => "classic", :headers => false}.merge options 
      out = ""
      begin
        Uv::init_syntaxes
        syn=( Uv::syntaxes_hash[ opts[:code_type].to_s ] )
        processor = Textpow::DebugProcessor.new
        syn.parse( tm_theme , processor )
        render_str = Uv::get_render_and_css( Plist::parse_xml(tm_theme) )  
        render_processor = Uv::RenderProcessor.new( render_str.first, line_numbers=opts[:line_numbers], headers=opts[:headers] )
        syn.parse( code_to_render, render_processor )
        out=[render_str.last, render_processor.string]
      rescue Exception=>e
        out=['<style type="text/css"></style>','<p>Error in tm_theme_to_html.</>']
      end 
   out
   end    
end