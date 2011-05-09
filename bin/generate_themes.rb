#! /usr/bin/ruby 
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


require File.dirname(__FILE__)+'./lib/rmthemegen/rmthemegen_187'

puts    
puts "  rmthemegen - creates theme files for use with rubymine (3.0.0 and up) "
puts "  Note: colors apply only to editor, not the IDE "
puts
puts "  by David Heitzman 2011 "
puts "  dheitzman@aptifuge.com -- Questions / Comments welcome. "
puts  
puts "  usage: rmthemegen <number of themes you want> "
puts
puts "  Instructions: Complete path of generated theme will be printed below "
puts "  Copy the rmt_*_*.xml files to: "
puts "  Linux: Copy xml files to  ~/.RubyMine3x/config/color. New themes should be present when you go to Settings/editor/Colors&Fonts "
puts "  Mac:  Copy xml files to ~/Library/Preferences/RubyMine/color. You must restart RubyMine on the Mac, then look for new color schemes. "
puts
 
l = RMThemeGen::ThemeGenerator.new

@iterations = ARGV[0] || 1
@iterations = @iterations.to_i 

@iterations.times do 
  puts l.make_theme_file 
  end
puts
