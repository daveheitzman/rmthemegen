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

    
    
    def to_textmate
      #it will save the theme file ".tmTheme" in the same directory as other themes
      #it will return the full name and path of that theme file.
      
      #has a theme been generated? if not, return nil
      #read_tmfile
      if !@theme_successfully_created then return nil end
    
      #bg_color_style: 0 = blackish, 1 = whitish, 2 = any color
      @theme_successfully_created=false
      @xml_textmate_out = {
                  :plist => [{:version=>"1.0"}],
                  :dict=>   [{:key=>["name"], 
                    :string =>[@themename],
                    :array=>[
                      {
                      :dict => [{
                        :key =>["settings"],
                        :dict=> [{"string"=>["#000000","#FFFFFF"],
                                  "key"=>["background","foreground"] 
                                }]
                    }]}]
                  }]
                }
        @savefile = "rmt_"+@themename+".tmTheme"
        @outf = File.new(@opts[:outputdir]+"/"+@savefile, "w+")
        #set_tm_doc_options
        #set_tm_doc_colors
        #set_tm_element_colors
        #XmlSimple.xml_out(@xml_textmate_out,{:keeproot=>false,:xmldeclaration=>true,:outputfile=> @outf, :rootname => ""})
        rexmlout = REXML::Document.new
        rexmlout << REXML::DocType.new('plist','PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"')
        rexmlout << REXML::XMLDecl.new("1.0","UTF-8",nil)
        plist = REXML::Element.new "plist"
        plist.add_attributes( "version"=>"1.0")
        dict = REXML::Element.new( "dict", plist) #causes plist to be the parent of dict
        dict.add_text(REXML::Element.new("key").add_text("name") )
        dict.add_text(REXML::Element.new("string").add_text( @themename ) )
        dict.add_text(REXML::Element.new("key").add_text("author") )
        dict.add_text(REXML::Element.new("string").add_text("David Heitzman") )
        dict.add_text(REXML::Element.new("key").add_text("settings") )
        main_array = REXML::Element.new("array",dict)
        doc_dict = REXML::Element.new("dict",main_array)
        doc_dict.add_text(REXML::Element.new("key").add_text("settings") )
        doc_dict.add_element(
          make_dict(
          :background=>"#"+@document_globals[:backgroundcolor].upcase,
          :caret=>"#"+ @document_globals[:CARET_COLOR].upcase ,
          :foreground=>"#"+@document_globals[:TEXT].upcase,
          :invisibles=>"#"+@document_globals[:backgroundcolor].upcase,
          :lineHighlight=>"#"+@document_globals[:CARET_ROW_COLOR].upcase,
          :selection=>"#"+@document_globals[:SELECTION_BACKGROUND].upcase) 
        ) 

        @@document_opts_to_textmate.each do |k,v|
          main_array.add_element(
           make_name_scope_settings(k,v) 
          ) if @textmate_hash[k]
        end

        uuid_key = REXML::Element.new("key")
        uuid_key.add_text("uuid")
        uuid_element = REXML::Element.new("string")
        uuid_element.add_text( gen_uuid)
        dict.add_element uuid_key
        dict.add_element uuid_element

        rexmlout << plist
#        rexmlout.write(@outf)
        formatter = REXML::Formatters::Pretty.new
        formatter.compact=true
        formatter.write(rexmlout, @outf)
        @outf.close	
        @theme_successfully_created = true
        return File.expand_path(@outf.path)
    end


    def make_dict(a_hash)
      new_dict = REXML::Element.new("dict")
      a_hash.each do |k,v| 
        te1 = REXML::Element.new("key")      
        te1.add_text(k.to_s) 
        te2 = REXML::Element.new("string")      
        te2.add_text(v.to_s)
        new_dict.add_element te1
        new_dict.add_element te2
      end
      return new_dict
    end 
    
    def make_name_scope_settings(ruby_symbol,an_array)
    fontstyles = ["","bold","italic", "bold italic"]
      #the array looks like ["name","scope",{}] . the third element in the array is a hash for "settings"
        new_dict = REXML::Element.new("dict")
        te1 = REXML::Element.new("key")      
        te1.add_text("name") 
        te2 = REXML::Element.new("string")      
        te2.add_text(an_array[0])
        te3 = REXML::Element.new("key")      
        te3.add_text("scope")
        te4 = REXML::Element.new("string")      
        te4.add_text(an_array[1])
        te5 = REXML::Element.new("key")
        te5.add_text("settings")      
        new_dict.add_element te1
        new_dict.add_element te2
        new_dict.add_element te3
        new_dict.add_element te4
        new_dict.add_element te5
        fontStyle = fontstyles[@textmate_hash[ruby_symbol][:FONT_TYPE].to_i ]
        di1 = make_dict(:foreground => "#"+@textmate_hash[ruby_symbol][:FOREGROUND].upcase, :fontStyle=>fontStyle) 
        new_dict.add_element di1
      return new_dict
    end

    
    def gen_uuid
        nn = sprintf("%X",rand(99999999999999999999999999999999999999999999999999).abs)
        nn = nn[0,8]+"-"+nn[12,4]+"-4"+nn[17,3]+"-"+["8","9","A","B"].shuffle[0]+nn[21,3]+"-"+nn[24,12]
    end

  end #class


end #module 
