#! /usr/bin/ruby 

# this script should take as input a file in XML format for a color theme 
# in textmate format, and produce a file that is compatible with rubymine
# By David Heitzman April 2011

require 'xmlsimple'
require './colortheme.rb'

puts "# this script should take as input a file in XML format for a color theme" 


inf = [] 

inf = Dir["stellar.xml"]

inf.each do |f|
  filw = File.new(f)
  if File.exists? filw then 
		puts f.to_s + " exists"
	end 
end 

entityattributekeys = Hash.new


inf.each do |f|
	if File.exists? f then 
		xml=XmlSimple.xml_in(f)

    puts "The whole XML file as a hash/array "
		puts xml.inspect
    xml["attributes"][0]["option"].each do |a|
#    puts a["name"].to_s#+" => "+a["value"].inspect
    #puts a["name"]+" --> "+a["value"]
    end 
  end
end
=begin

##### GRAB the theme's name, author 
    themename = xml["dict"][0]["string"][1]
    themeauth = xml["dict"][0]["string"][0]
    puts "themename, themeauth #{themename}, #{themeauth}"

		sett = xml["dict"][0]["array"][0]["dict"]	 

#### Grab theme's global document settings and put in sym - keyed hash
		docsettings = Hash.new
		docsettingkeys = sett[0]["dict"][0]["key"]
    docsettingvals = sett[0]["dict"][0]["string"]
    
    docsettingkeys.each_index do |k| 
      docsettings[docsettingkeys[k].to_sym]=docsettingvals[k]  
    end
    
    puts
#    puts "main document settings: "+ docsettings.inspect
    puts
    
    
## grab the entities' attributes - Pretty name, scope name, 
## fg color, bg color, italic, bold, underline
    

    textattribs = sett.drop(1)
    puts "text attributes for: "+f
    textattribs.each do |a | 
      puts a["string"][1].inspect
      entityattributekeys[ a["string"][0] ] = a["string"][1] 
    end 
  end
  
end 

  puts
  puts
  puts

  puts "all entity attribute keys found: "
  puts 
  entityattributekeys.each_key do |i|
    #puts i.inspect
    
    #puts i.to_s+" => "+entityattributekeys[i]   

  end 

=begin
inf = "stellar.xml"
f = File.open(inf)
outf = File.new("xmlhash_out","w+")
puts "stellar.xml"
	xml= XmlSimple.xml_in(f, "keeproot" => true)
	puts xml.inspect

outf.printf(XmlSimple.xml_out(xml, "keeproot" => true))
outf.close

newtheme = xml
puts "CharlesBusch"
puts newtheme.inspect

newthemexmlfile = File.new("CharlesBusch","w+")
puts newtheme["scheme"][0]["name"] = "CharlesBusch"

#do all the things of making a theme

#save file
newthemexmlfile.printf( XmlSimple.xml_out(newtheme,{:keeproot=>true, :xmldeclaration => true }) )

rootoptions = ["LINE_SPACING","EDITOR_FONT_SIZE","EDITOR_FONT_NAME" ]


=end
