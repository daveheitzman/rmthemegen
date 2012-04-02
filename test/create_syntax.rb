require 'rubygems'
require 'textpow'
require 'uv'


  # Uv::init_syntaxes
  # Uv::syntaxes_hash['ruby'].inspect
  # syn=( Uv::syntaxes_hash['ruby'] )
  # processor = Textpow::DebugProcessor.new

  # syn.parse(File.read('create_syntax.rb'), processor)

  # render_str = Uv::get_render_and_css( Plist::parse_xml('./rmt_frail_creature.tmTheme') )  
  # render_processor = Uv::RenderProcessor.new( render_str.first, line_numbers=true, headers=true )

  # syn.parse( File.read('create_syntax.rb') , render_processor )
  # puts render_str.last + render_processor.string


puts   Uv::tmtheme_to_html( File.read('./rmt_frail_creature.tmTheme'),"def foodie\n puts 'foodie'\n end ",{:line_numbers => true, :render_style => "classic", :headers => true, :code_type=>'ruby'} )
