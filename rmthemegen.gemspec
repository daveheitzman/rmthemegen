# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rmthemegen/version"

Gem::Specification.new do |s|
  s.name        = "rmthemegen"
  s.version     = "0.0.23"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Heitzman"]
  s.email       = ["evolvemeans@gmail.com"]
  s.homepage    = "http://aptifuge.com"
  s.summary     = %q{Generates RubyMine >= 3.0 editor color themes}
  s.description = %q{}
  s.rubyforge_project = "rmthemegen"

  s.required_ruby_version = '>= 1.8.7'

  s.add_dependency('xml-simple', ">= 1.0.15")
  s.add_dependency('color',">=1.4.1")
  
  s.bindir = "bin"
  s.executables = ['bin/generate_themes.rb']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "generated_themes", "bin"]
  
end
