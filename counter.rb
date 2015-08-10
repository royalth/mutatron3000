require 'parser/current'

class Counter < Parser::Rewriter
	@instanceNumber = 0
	def addInstance 
		@instanceNumber += 1
	end
	def getInstances
		return @instanceNumber
	end
end
