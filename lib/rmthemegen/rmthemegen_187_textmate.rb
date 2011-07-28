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
        plist.add_attributes :version=>"1.0"
        dict = REXML::Element.new( "dict", plist)
        rexmlout << plist
#        rexmlout.write(@outf)
        REXML::Formatters::Pretty.new.write(rexmlout, @outf)
        @outf.close	
        @theme_successfully_created = true
        return File.expand_path(@outf.path)
    end
  end #class

end #module 
