require File.expand_path("../../lib/rmthemegen/rmthemegen_187.rb",__FILE__)
require 'test/unit'


class RmthemegenTests < Test::Unit::TestCase
  def setup
    @generator = RMThemeGen::ThemeGenerator.new
    @filename = @generator.randthemename
  end

  def test_random_names_ok
      assert !@filename.nil?
  end
  
  def teardown
  end

end 
