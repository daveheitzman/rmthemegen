module Rmthemegen
  # Your code goes here...

  if RUBY_VERSION == "1.8.7"
    require File.dirname(__FILE__)+"/rmthemegen/rmthemegen_187.rb"
  else
    require File.dirname(__FILE__)+"/rmthemegen/rmthemegen.rb"
  end

end
