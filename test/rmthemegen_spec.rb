require '../lib/rmthemegen/token_list.rb'
require '../lib/rmthemegen/rmthemegen.rb'

describe "randthemename" do
	it "should deliver a random filename " do
	rmtg = RMThemeGen.new 
  rmtg.randthemename.should != ""
  end
end 
