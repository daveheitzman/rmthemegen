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

require 'rubygems'
require File.dirname(__FILE__)+'./lib/rmthemegen/rmthemegen_187'
require File.dirname(__FILE__)+'./lib/rmthemegen/rmthemegen_187_textmate'
require 'xmlsimple'

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

tm_files = Dir.glob("*.tmTheme")
puts tm_files.inspect
@doc_opts_accum = Hash.new
@element_tokens = {}
@element_scopes = {}
@token_to_scope = {}  

tm_files.each do |inf|
  puts "xml_in for "+inf.to_s
  @inf = File.open(inf,"r")
  @tm_xml_in = XmlSimple.xml_in(@inf)
 # puts @tm_xml_in.inspect
  
  @doc_opts_accum.merge!( @tm_xml_in["dict"][0]["array"][0]["dict"][0]["dict"][0])
  
  @tm_xml_in["dict"][0]["array"][0]["dict"].each_index do |i|  
    #find index of "scope" in array "key"
#    puts i.to_s+" |e| |e| "+@tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][1].inspect if @tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"]
    if @tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"] 
    token = @tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][0]
    scope =@tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][1]
    @token_to_scope[token.to_s] = scope.to_s
    end 
#    @element_tokens[@tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][0].to_s]=1 if @tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"]
 #   @element_scopes[@tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][1].to_s ]=1 if @tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"]
  #  @token_to_scope[@tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][0].to_s]=@tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][1] 
#    @element_tokens.add( @tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"][1].to_s]) if @tm_xml_in["dict"][0]["array"][0]["dict"][i]["string"]

    #scope_ind = e[:key].index_of["scope"]
    #puts "scope_ind = "+scope_ind
       
  end 

#  @outf = File.new("zxzxzxzxzx.tmTheme","w+")
#  XmlSimple.xml_out(@tm_xml_in, {:keeproot=>true,:xmldeclaration=>true,:outputfile=> @outf, :rootname => "scheme"})
#  @outf.close
end
  puts "@doc_opts_accum: "+@doc_opts_accum.inspect
  puts "@element_tokens: " + (@element_tokens.keys.collect do |e|
      e 
    end).to_s 
  puts @element_tokens.size.to_s
  puts "@element_scopes: " + (@element_scopes.collect do |s|
    s
  end).to_s 
  puts @element_scopes.size.to_s 
  tts=""
  @token_to_scope.each do |k,v|
    tts +=k.to_s + " => "+v.to_s+"\n"
  end
  puts "@token_to_scope: " + tts  
  puts @token_to_scope.size.to_s 

  
Kernel.exit
 
l = RMThemeGen::ThemeGenerator.new

1.times do 
  puts l.make_theme_file(ENV["PWD"],0,nil) 
  puts l.to_textmate
  end
puts "testing to_css"
puts l.to_css

puts
