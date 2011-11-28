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


  require File.dirname(__FILE__)+'./lib/rmthemegen/rmtg_rubymine'
  require File.dirname(__FILE__)+'./lib/rmthemegen/rmtg_textmate'
  #require File.dirname(__FILE__)+'./lib/rmthemegen/rmthemegen_187_textmate'
#  require File.dirname(__FILE__)+'./lib/rmthemegen/rmtg187_new_textmate'
  #require File.dirname(__FILE__)+'./lib/rmthemegen/plist_to_tokenlist'
  puts "TEST TEST TEST"
  puts
  puts "  Mac:  Copy xml files to ~/Library/Preferences/RubyMine/color. You must restart RubyMine on the Mac, then look for new color schemes. "
  puts

=begin
  c=Color::RGB.new(0,0,0)
  1000.times do
  puts c.next_gaussian(0.50 )
  end
  Kernel.exit
=end


  l = RMThemeGen::ThemeTextmate.new

  10.times do
  #  puts l.make_theme_file(:outputdir => ENV["PWD"],:bg_color_style => 0 )
  #  puts l.make_theme_file(ENV["PWD"],0,[{:r=>0.0,:g=>0.0},{:r=>1.0,:g=>0.0,:b=>0.0}])
    puts l.make_theme_file(ENV["PWD"],:dark,nil,nil)
    #puts newTmTheme=l.make_tm_theme_file(ENV["PWD"],(rand*2).to_i,nil,nil)

    puts "testing to_css"
#    puts l.to_css
    puts "testing themename"
    puts l.themename
    puts
#    Uv::Converters.tmtheme2render( File.expand_path(File.dirname(__FILE__))+"/textmate_themes/choco.tmTheme", File.dirname(__FILE__) )
 #   Uv::Converters.tmtheme2render( newTmTheme,"." )
=begin
    puts '@for_tm_output.inspect'
  #  puts l.for_tm_output.inspect
    token_ary = []
    l.for_tm_output.each do |k,v|
     # puts k.inspect
      token_ary << k.to_s
    end

    token_ary.sort!
    nary3=[]
    token_ary.each do |i|
      nary3 << [i,l.for_tm_output[i] ]
    end
    nary3.each do |i|
      puts i.inspect
    end
    puts 'number of tokens: '
    puts l.for_tm_output.size

    puts 'top_level_names'
    l.repository_names.each do |n|
      puts n.inspect
    end
    puts '------------------------->>> under patterns <<<--------------------------- '
    l.under_patterns.each do |p,v|
     puts p.to_s+"=>"+v.to_s
    end
    #puts l.under_patterns.inspect
    #puts "testing plist_to_tokenlist.rb"
    #l.process_plists
    puts
=end
  end
