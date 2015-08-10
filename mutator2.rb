require 'parser/current'

class Mutator < Parser::Rewriter 
	@instanceCounter
	@mutationMode
	def initalize
		@instanceCounter = 0
		@mutationMode = false
	end
	def countInstance
		@instanceCounter++
	end
	def switchMode 
		mutationMode = true
		random = Random.new
		@instanceCounter = random.rand(@instanceCounter)
	end
	def mutateHere?
		@instanceCounter -= 1
		return @instanceCounter == 0
	end
	def work(node)
		if mutationMode && mutateHere?
			doMutate(node)
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
