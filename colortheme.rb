#colorTheme


module ColorTheme
	
	class ColorTheme
		attr_accessor :docset, :elemset

		def initialize
			self.docset = DocSettings.new
			self.elemset = ElementSetting.new
		end 	
		
		# this will read all the textmate-formatted color files and grab all the
		# tokens out of them. 
		def getTMtokens
		end 
	
		# this will read all the RubyMine-formatted color files and grab all the
		# tokens out of them. 
		def getRMtokens
		end

		def readTMfile
		end
		
		def readRMfile
		end
		
	end #class ColorTheme

	#a representation of a token for TextMate style theme 
	class TMtoken
	end 

	#a representation of a token for RubyMine style theme 
	class RMtoken
	end
	
	class AbstractTheme
		attr_accessor :name
	end

	class DocSettings
		def initialize
		end
	end
	
	class ElementSetting
		def initialize
		end
	end


end

ct = ColorTheme::ColorTheme.new

