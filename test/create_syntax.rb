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

  get_syntaxes
  Uv::syntaxes_hash['ruby'].inspect
  syn=( Uv::syntaxes_hash['ruby'] )
  processor = Textpow::DebugProcessor.new

  syn.parse(File.read('create_syntax.rb'), processor)

  render_str = Uv::get_render_and_css( Plist::parse_xml('./rmt_handicapped_fisherman.tmTheme') )  
  render_processor = Uv::RenderProcessor.new( render_str.first, line_numbers=true, headers=true )

  syn.parse( File.read('create_syntax.rb') , render_processor )
  puts render_str.last + render_processor.string

