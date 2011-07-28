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
require 'rexml/document'
require File.dirname(__FILE__)+"/token_list"
require File.dirname(__FILE__)+'/rgb_contrast_methods'
require File.dirname(__FILE__)+'/rmthemegen_to_css'

module RMThemeGen

  class ThemeGenerator < RMThemeParent

    
    
    def to_textmate
      #it will save the theme file ".tmTheme" in the same directory as other themes
      #it will return the full name and path of that theme file.
      
      #has a theme been generated? if not, return nil
      #read_tmfile
      if !@theme_successfully_created then return nil end
    
      #bg_color_style: 0 = blackish, 1 = whitish, 2 = any color
      @theme_successfully_created=false
      @xml_textmate_out = {
                  :plist => [{:version=>"1.0"}],
                  :dict=>   [{:key=>["name"], 
                    :string =>[@themename],
                    :array=>[
                      {
                      :dict => [{
                        :key =>["settings"],
                        :dict=> [{"string"=>["#000000","#FFFFFF"],
                                  "key"=>["background","foreground"] 
                                
                                }]
                                
                                
                    }]}]
                  }]
                }
        @savefile = "rmt_"+@themename+".tmTheme"
        @outf = File.new(@opts[:outputdir]+"/"+@savefile, "w+")
        #set_tm_doc_options
        #set_tm_doc_colors
        #set_tm_element_colors
        #XmlSimple.xml_out(@xml_textmate_out,{:keeproot=>false,:xmldeclaration=>true,:outputfile=> @outf, :rootname => ""})
        rexmlout = REXML::Document.new
        rexmlout << REXML::DocType.new('plist','PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"')
        rexmlout << REXML::XMLDecl.new("1.0","UTF-8",nil)
        plist = REXML::Element.new "plist"
        plist.add_attributes( "version"=>"1.0")
        dict = REXML::Element.new( "dict", plist) #causes plist to be the parent of dict
        dict.add_text(REXML::Element.new("key").add_text("settings") )
        dict.add_element(REXML::Element.new("name").add_text("cloudy marbles") )
        dict.add_element(make_dict(:background=>"#FFFFFF" ))
        rexmlout << plist
#        rexmlout.write(@outf)
        formatter = REXML::Formatters::Pretty.new
        formatter.compact=true
        formatter.write(rexmlout, @outf)
        @outf.close	
        @theme_successfully_created = true
        return File.expand_path(@outf.path)
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


  end #class


end #module 
