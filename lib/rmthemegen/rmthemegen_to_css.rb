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

module RMThemeGen
  class ThemeGenerator < RMThemeParent
    
      def to_css
      s = '<style type="text/css">'
      s += "#"+ @schemename.to_s + " { background-color: #{@backgroundcolor.to_s}; } "
      s += "#"+ @schemename.to_s + " <token name> color:" 
      
      s += '</style>' 
      return s
      end
  end #class ThemeGenerator < RMThemeParent
end #module RMThemeGen
