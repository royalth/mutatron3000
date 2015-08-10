require 'parser/current'

class Mutator < Parser::Rewriter 
	@instanceCounter
	@mutationMode
	def initialize
		@instanceCounter = 0
		@mutationMode = false
	end
	def countInstance
		@instanceCounter += 1
	end
	def switchMode 
		@mutationMode = true
		random = Random.new
		@instanceCounter = random.rand(@instanceCounter)
		@instanceCounter += 1
	end
	def mutateHere?
		@instanceCounter -= 1
		return @instanceCounter == 0
	end
	def work(node)
		if @mutationMode 
			if mutateHere?
				doMutate(node)
			end 	
		else 
			countInstance
		end
	end
	def doMutate(node)
		raise NotImplementedError.new("You must implement own doMutate method.")
	end
	
	def mutation(buffer, ast)
		rewrite(buffer, ast)
		switchMode
		return rewrite(buffer, ast)
	end
end
