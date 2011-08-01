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
    
    # input: nothing -- This method goes into ./syntaxes directory and handles all the plists
    # output: creates a hash containing an element name => style mapping.  
    def process_plists
      @for_tm_output = {}
      files_look_in = Dir[File.dirname(__FILE__)+"/syntaxes/*.plist"]
      files_look_in = Dir[File.dirname(__FILE__)+"/syntaxes/PHP.plist"]
      puts files_look_in.inspect
      files_look_in.each do |f|
        puts "opening file "+f.to_s 
        syntax_file = File.open(f,"r")


      indoc = REXML::Document.new( syntax_file )
      
      indoc.elements.each("*/dict") do |ele|
        handle_as_leaf ele
        
      
      
      end 
=begin      
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
=end
      } 


        syntax_file.close       
      end
        
    puts '@for_tm_output.inspect'
    puts @for_tm_output.inspect
    end
    
    def visit_all_nodes(element, &block)
        if element.is_a?(REXML::Element)  
          if element.has_elements?  
            element.each do |kkid|
              visit_all_nodes( kkid, &block) 
            end 
          else
            if (element.respond_to?(:text) )
              yield element
            end
        end
    end #visit_all_nodes
    
    def handle_as_leaf(dict_element)
      #input: a node / element. All the dicts found inside key:name => string:value pairs will be given the same color
      # dict_element.#(has_child that is a <key>captures</key>)?
      # dict_element.#(has_child that is a <key>begincaptures</key> or <key>endcaptures</key> )?
#      if true #then visit_all_nodes, giving each one the same color
 #     if not, then handle_as_leaf(all dict_children of dict_element)
      return unless dict_element.respond_to? :local_name
      if dict_has?(self,["captures","beginCaptures","endCaptures"]) 
        if dict_has_immediate_kids(self,["captures","beginCaptures","endCaptures"])
      end 
    end #handle_as_leaf
    
    #input: an array of element names (strings) 
    #output: tells whether dict has any children that are named any of the elements in the array
    def dict_has?(dict,element_names_arr) 
      visit_all_nodes(dict) { |e|
        if element_names_arr.include?(e.local_name) 
          return true
        end 
      }
    end 
  
  end #class
end #module 
