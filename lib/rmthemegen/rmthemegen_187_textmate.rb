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

    def set_doc_options
    end

    def set_doc_colors
    end

    def set_element_colors
    end

    def to_textmate
      #it will save the theme file ".tmTheme" in the same directory as other themes
      #it will return the full name and path of that theme file.
      
      #has a theme been generated? if not, return nil
      if !@theme_successfully_created return nil
    
      #bg_color_style: 0 = blackish, 1 = whitish, 2 = any color
      @theme_successfully_created=false
      @xml_textmate_out = {:plist => [{:version=>"1.0"}],
                            :scheme=>
                [{:name => @themename,:version=>@themeversion,:parent_scheme=>"Default",
                  :option =>[{:name=>"pencil length",:value=>"48 cm"},{:name => "Doowop level", :value=>"medium"}],
                  :colors => [{ :option => [{:name=>"foreground",:value => "yellow"},{:name=>"background",:value => "black"} ] }],
                  :attributes => [{:option=>[
                                  {:name=>"2ABSTRACT_CLASS_NAME_ATTRIBUTES", :value=>[{:option=>{:name=>"foreground",:value=>"red"}}] },
                                  {:name=>"4ABSTRACT_CLASS_NAME_ATTRIBUTES", :value=>[{:option=>{:name=>"foreground",:value=>"red"}}] }
                                  ] 
                                 }]
                }]
                }
        @savefile = "rmt_"+@themename+".thTheme"
        @outf = File.new(opts[:outputdir]+"/"+@savefile, "w+")
        set_doc_options
        set_doc_colors
        set_element_colors
        XmlSimple.xml_out(@xml_textmate_out,{:keeproot=>true,:xmldeclaration=>true,:outputfile=> @outf, :rootname => "scheme"})
        @outf.close	
        @theme_successfully_created = true
        return File.expand_path(@outf.path)
    end
  end #class

end #module 
