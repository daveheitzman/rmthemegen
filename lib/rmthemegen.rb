  # Your code goes here...
  require File.expand_path(__FILE__,"rmthemegen/rmthemegen_187.rb")
  require 'uv'
  require 'uv/utility'
  require 'plist'

  module Uv

   def Uv.syntaxes_hash
      Uv.init_syntaxes unless @syntaxes
      @syntaxes 
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
        # Uv::init_syntaxes
        syn=( Uv.syntax_node_for opts[:code_type].to_s  )

        processor = Textpow::DebugProcessor.new
        syn.parse( tm_theme , processor )
        render_str = Uv::get_render_and_css( Plist::parse_xml(tm_theme) )  
        render_processor = Uv::RenderProcessor.new( render_str.first, line_numbers=opts[:line_numbers], headers=opts[:headers] )
        syn.parse( code_to_render, render_processor )
        # RenderProcessor.load('xhtml', opts[:render_style], opts[:line_numbers], opts[:headers]) do |processor|
        #   syntax_node_for(opts[:code_type]).parse(code_to_parse, processor)
        # end.string

         out=[render_str.last, render_processor.string]
        # out=[render_str.last, RenderProcessor.load('xhtml', opts[:render_style], opts[:line_numbers], opts[:headers]) do |processor|
        #   syntax_node_for(opts[:code_type]).parse(code_to_parse, processor)
        # end.string]
      rescue Exception=>e
        out=['<style type="text/css"></style>',e.inspect,'<p>Error in tm_theme_to_html.</>']
      end 
   out
   end    
end    