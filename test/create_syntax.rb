require 'rubygems'
require 'textpow'
require 'uv'

  def get_syntaxes
      @syntaxes = {}
      Dir.glob( File.join(File.dirname(__FILE__) , '*.plist') ).each do |f| 
        @syntaxes[File.basename(f)] = Textpow::SyntaxNode.load( f )
      end
      @syntaxes
  end 

puts  get_syntaxes.inspect
 # puts syn= Textpow::SyntaxNode.new( @syntaxes[@syntaxes.keys.first].to_s)
 # puts Uv::syntaxes.inspect
 # puts Uv::syntaxes_hash.inspect
 puts Uv::syntaxes_hash['ruby'].inspect
 #puts syn=( Uv::syntaxes_hash['ruby'] )
  processor = Textpow::DebugProcessor.new

  puts syn.respond_to?( :parse).to_s 
  puts syn.parse("def myvar ; return 100; end ", processor)
  puts syn.parse(File.read('create_syntax.rb'), processor)

