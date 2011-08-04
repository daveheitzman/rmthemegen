#**********************************************************************
#*                                                                    *
#*  RmThemeGen - a ruby script to create random, usable themes for    *
#*  text editors. Currently supports RubyMine 3.X.X                   *
#*                                                                    *
#*  By David Heitzman, 2011                                           *
#*                                                                    *
#**********************************************************************

#get_tm_scopes is a utility script to grab all the scope lines out of the tmthemes stored
# in the subdirectory under test 

#this is a version of the software that should work with ruby 1.8.7
#originally it was written and tested for ruby 1.9.2

require 'rubygems'
#require 'color'
#require 'xmlsimple'
require 'rexml/document'
#require File.dirname(__FILE__)+"/token_list"
#require File.dirname(__FILE__)+'/rgb_contrast_methods'
#require File.dirname(__FILE__)+'/rmthemegen_to_css'


class ScopeEater
    def get_scopes_from_themefiles
      @scopes = {}
      @files_look_in = Dir[File.dirname(__FILE__)+"/textmate_themes/*.tmTheme"]
#      files_look_in = Dir[File.dirname(__FILE__)+"/syntaxes/Ruby.plist"]
      puts @files_look_in.inspect
      
      @files_look_in.each do |f|
        puts "opening file "+f.to_s 
        syntax_file = File.open(f,"r")
        indoc = REXML::Document.new( syntax_file )


        visit_all_nodes(indoc.root) { |k|
          begin
            if (k.respond_to?(:local_name) )
              if (k.parent.name=='dict' && (k.previous_element.respond_to?(:local_name)  ) )
                if ( k.previous_element.local_name=='key' && k.previous_element.text=="scope" )
                  @scopes[k.text.to_s]=''
                end
              end
            end
          rescue => e
            puts "an exception in process_plists(): "+e.to_s 
          end
        } 
          
      syntax_file.close       
      end #files_look_in.each
      outf=File.new("scopes_harvested","w")
        @scopes.each do |s|
        outf.puts s
      end 
      outf.close 
    puts "harvested #{@scopes.size} scopes from #{@files_look_in.size} files."  

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
end #class ScopeEater

e=ScopeEater.new
e.get_scopes_from_themefiles


