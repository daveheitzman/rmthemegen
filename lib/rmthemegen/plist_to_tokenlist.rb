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
    attr_reader :for_tm_output, :top_level_names
    def process_plists
      @for_tm_output = {}
      files_look_in = Dir[File.dirname(__FILE__)+"/syntaxes/*.plist"]
      files_look_in = Dir[File.dirname(__FILE__)+"/syntaxes/Ruby.plist"]
      puts files_look_in.inspect
      
      files_look_in.each do |f|
        puts "opening file "+f.to_s 
        syntax_file = File.open(f,"r")
        indoc = REXML::Document.new( syntax_file )


      visit_all_nodes(indoc.root) { |k|

        begin
          if (k.respond_to?(:local_name) )
            if (k.parent.name=='dict' && (k.previous_element.respond_to?(:local_name)  ) )
              if ( k.previous_element.local_name=='key' && k.previous_element.text=="name" )
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
              end
            end
          end
        rescue => e
          puts "an exception in process_plists(): "+e.to_s 
        end
      } 

      # take the list of tokens. Find all unique word.word prefixes. Each of them becomes a key in a new hash
      # Each key points to a long string made up of a concatenation of all of the tokens from the list whose prefix
      # matches the found prefix.
      # so, given keyword.other.new.php and keyword.other.phpdoc.doc, we would have @hash['keyword.other']="keyword.other.new.php and keyword.other.phpdoc.doc"
      
      puts '@for_tm_output keys listed alphabetically '
      token_ary = []
      @for_tm_output.each do |k,v|
        # puts k.inspect
        token_ary << k.to_s
      end 
          
      token_ary.sort!
      token_ary.each do |i|
         puts i.to_s 
      end 
      
      @nhash2 = {}
      @for_tm_output.each_key do |t|
        tkary=t.to_s.split(".")
        if tkary.size >= 2
          @nhash2[ tkary[0]+"."+tkary[1] ] ||= ''
          @nhash2[ tkary[0]+"."+tkary[1] ] += t+" "
        else
          @nhash2[t]=''
        end
      end
      
      @for_tm_output = @nhash2
      @top_level_names = {}

      indoc.root.elements.each("*/dict") do |e|
        #return if !e.respond_to? :local_name
        #return if e.local_name != "dict"
        
        #okay, so this does reliably give us the top-level names (each of the ee's is one of them) 
        e.elements.each do |ee|          
          if ee.name == "key" 
            puts " ***** " 
            @top_level_names[ee.text.to_s] = ''
            puts ee.to_s 
            puts " ***** " 
            if ee.next_element 
              visit_all_nodes(ee.next_element)  do |eer|
                  if eer.name == "string" && eer.previous_element.name == "key" &&  eer.previous_element.text == "name"
                    @top_level_names[ee.text.to_s] += eer.text.to_s+" " 
                  end
              end 
            end 
          end 
        end 
      end 
      syntax_file.close       
      end #files_look_in.each
    end #process_plists
    
    def visit_all_nodes(element, &block)
        if element.is_a?(REXML::Element) 
          if element.has_elements? then 
            element.each do |kkid|
              visit_all_nodes( kkid, &block) 
            end
          else
            yield element
          end           
        end 
    end #visit_all_nodes
    
    def handle_as_leaf()
      #input: a node / element. All the dicts found inside key:name => string:value pairs will be given the same color
    
    end
  end #class
end #module 
