require 'parser/current'

class Mutator < Parser::Rewriter 


	@instanceCounter
	def initalize(instanceNumber)
		random = Random.new
		@instanceCounter = random.rand(instanceNumber)
	end
	def mutateHere? 
		instanceCounter -= 1
		return instanceCounter == 0
	end
end
