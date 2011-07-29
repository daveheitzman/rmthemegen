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
    def process_plists

      @for_tm_output = {}
      indoc = REXML::Document.new( File.new("./PHP.plist") )
      
      visit_all_nodes(indoc.root) { |k|
      begin
#        puts "*********************"
    #    puts 'k.inspect = '+k.inspect
   #     puts 'k.value='+k.value.to_s
  #      puts 'k.xpath='+k.xpath.to_s
 #       puts 'k.to_s ='+k.to_s

#       puts 'k.text ='+k.text.to_s
 #      puts 'k.local_name ='+k.local_name.to_s
  #     puts 'k.name ='+k.name.to_s
   #    puts 'k.to_s ='+k.to_s
#        puts 'k.string ='+k.string.to_s
#        puts 'k.node_type='+k.node_type.to_s
#        puts 'k @string='+k.instance_variable_get( :string)
#        puts 'kkid.methods'
#        puts kkid.methods
#        puts 'kkid.instance_variables'
#        puts kkid.instance_variables
#        puts "ATTRIBUTES[0]"
 #       puts k.attributes[0].to_s
#        k.attributes.each do |a|
 #         puts a.to_s
  #      end 
       # puts "-->>"+k.to_s+"<--" 
      @for_tm_output[k.text.to_s]=''
      rescue => e
        puts "an exception in process_plists(): "+e.to_s 
      end
      } 
        
    puts '@for_tm_output.inspect'
    puts @for_tm_output.inspect
    end
    
    def visit_all_nodes(element, &block)
        if element.is_a?(REXML::Element) && element.has_elements? then 
          element.each do |kkid|
            visit_all_nodes( kkid, &block) 
          end 
        else
        #element.name=='string' && !element.previous_sibling_node.nil? &&&&             element.previous_sibling_node.name=='string' 
          if (element.respond_to?(:local_name) )
            if (element.parent.name=='dict' && (element.previous_element.respond_to?(:local_name)  ) )
              if ( element.previous_element.local_name=='key' && element.previous_element.text=="name" )
                yield element
              end
            end
          end
        end 
    end 
  end #class
end #module 
