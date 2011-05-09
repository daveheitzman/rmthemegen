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


require File.dirname(__FILE__)+'/rmthemegen_187'

    
puts "rmthemegen - creates theme files for use with rubymine (3.0.0 and up) "
puts "by David Heitzman 2011 "
  
puts "generating themes into current directory. Filenames: rmt_xyz.xml "

l = RMThemeGen::ThemeGenerator.new

@iterations = ARGV[0] || 1
@iterations = @iterations.to_i 

@iterations.times do 
  puts l.make_theme_file 
  end
