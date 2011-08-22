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


module RMThemeGen
  class ThemeTextmate < RMThemeParent
    attr_reader :for_tm_output, :repository_names, :under_patterns, :scopes_found
   attr_accessor :scopes_found_count
    # process_plists is an attempt to take from teh syntax files that are included as "textmate bundles" 
    # and use the tokens described to create syntax-themes. This attempt has so far been unsuccessful.
    # all of the example theme files found in the wild do not use the tokens found in the syntax files,
    # so there is some other way it has of mapping code to symbols. 
    
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
      
      token_ary = []
      @for_tm_output.each do |k,v|
        token_ary << k.to_s
      end 
          
      token_ary.sort!
      token_ary.each do |i|
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
      
      @repository_names = {}

      indoc.root.elements.each("*/dict") do |e|
        #okay, so this does reliably give us the top-level names (each of the ee's is one of them) 
        e.elements.each do |ee|          
          if ee.name == "key" 
            puts " ***** " 
            @repository_names[ee.text.to_s] = ''
            puts ee.to_s 
            puts " ***** " 
            if ee.next_element 
              visit_all_nodes(ee.next_element)  do |eer|
                  if eer.name == "string" && eer.previous_element.name == "key" &&  eer.previous_element.text == "name"
                    @repository_names[ee.text.to_s] += eer.text.to_s+" " 
                  end
              end 
            end 
          end 
        end 
      end 
      
      @under_patterns={}
      indoc.root.elements.each("*/key") do |e|
          main_name=''
          if e.text == "patterns"  
            e.next_element.elements.each do |ee| #this is the main array of patterns -- these should be the dicts who define the patterns caught by the syntax engine
              if ee.name=="dict"
#              puts "<<>>"+ee.inspect+"<<>>"
#              puts "<<again>>"+ee.elements.size.to_s+"<<>>"
                ee.elements.each do |cc|
                  if  ["name", "contentName"].include? cc.text 
                  main_name = cc.next_element.text   
                  puts "main_name"+main_name
                  @under_patterns[main_name]=""
                  end 
                end
              
                ee.elements.each do |di|
                  if di.name="dict"
                    di.elements.each do |di_ch|
                      di_ch.elements.each do |leaf|
                        if leaf.previous_element 
                          @under_patterns[main_name] += leaf.text.to_s+", "  if (leaf.name=="string" && leaf.previous_element.text == "name") 
                        end 
                      end 
                    end 
                  end 
                end
              end 
            end
          end  
      end
#    @under_patterns.each_key do |k| @under_patterns[k] = @under_patterns[k][ 0, @under_patterns[k].size-2 ] end 
      @under_patterns.each do |k,v| @under_patterns[k] = v[ 0, v.size-2 ] end 
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
    
    
    def get_scopes_from_themefiles
      self.scopes_found_count = {}
      scopes_found = []
#    files_look_in = Dir[File.dirname(__FILE__)+"/textmate_themes/*.tmTheme"]
      files_look_in = Dir[File.dirname(__FILE__)+"/textmate_themes/Brilliance Black.tmTheme"]
      use_scope_threshhold =0 # a scope will be used only if it appears at least this number of times in the existing themes 

      num_sf =0
      
      files_look_in.each do |f|
        syntax_file = File.open(f,"r")
        indoc = REXML::Document.new( syntax_file )
        visit_all_nodes(indoc.root) { |k|
          begin
            if (k.respond_to?(:local_name) )
              if (k.parent.name=='dict' && (k.previous_element.respond_to?(:local_name)  ) )
                if ( k.previous_element.local_name=='key' && k.previous_element.text=="scope" )
                  # the following monkey business allows us to see how many times we've seen a key
                  num_sf += 1
                  scopes_found << k.text.to_s
                  if scopes_found_count[k.text.to_s]
                    scopes_found_count[k.text.to_s] += 1
                  else
                    scopes_found_count[k.text.to_s] = 1
                  end 
                end
              end
            end
          rescue Exception => e
            puts "an exception in process_plists(): "+e.to_s 
          end
        } 
#      puts "Found #{@num_sf} scopes in file #{syntax_file.to_s}"    
      syntax_file.close       
      end #files_look_in.each
      scopes_found_count.each do |k,v|
        #puts k+"->"+v.to_s
        scopes_found_count.delete(k) unless v >= use_scope_threshhold
        
      end 

      outf=File.new("scopes_harvested","w")
      outf.printf "%s","["
      scopes_found.each do |k,v|
        outf.printf("%s","'"+k.to_s+"', ")
      end 
      outf.printf "]"
      outf.close 
      puts "plist_to_tokenlist line 205: harvested #{scopes_found.size} scopes from #{files_look_in.size} files."  
      return scopes_found
   end #get_scopes_from_themefiles
  end #class
end #module 
