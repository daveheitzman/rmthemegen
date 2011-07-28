#!/usr/bin/env ruby 

#this is to open all of the editable text files in the current and all subdirectories into geany
if !File.exist?("/usr/bin/geany") 
   exit "Put geany or a link to it in /usr/bin and this will work. "
end

class Geanyfy
   attr_accessor :filelist, :openables, :subs

   def initialize
      @openables = ["*.php","*.rb","*.sql","*.py","*.h","*.c","*.java","*.js","*.html","*.htm","*.css", "*.xml"]
      @filelist = []
      @subs = []
      get_file_list(ENV["PWD"])
      open_all_files
   end

   def get_file_list(curdir)
      match_openables(curdir)
      alldirs = Dir.glob(curdir+"/**")
      alldirs.each do |f|
         get_file_list(f) if File.directory?(f) && ![".",".."].include?( f) 
      end
   end

   def match_openables(dir_string)
      #returns an array of filenames that are of the type specified by @openables
      @openables.each do |o|
         dir_string += File::SEPARATOR if dir_string[-1,1] != File::SEPARATOR
         @filelist.concat Dir[dir_string+o]
      end 
   end   

   def open_all_files
      @open_string = "/usr/bin/geany "
      @filelist.each do |f|
         @open_string += " " + f
      end
      @open_string += " & "
      `#{@open_string} `
   end
end 

g=Geanyfy.new
