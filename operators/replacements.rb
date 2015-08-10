require '../mutator'

class OR < Mutator
	@ops, @rep

	def getReplacement(op)
		reps = @rep[op]
		random = Random.new
		return reps[random.rand(reps.size)]
	end

	def on_send(node)
		if ops.include? node.loc.selector.source
			work(node)
		end
		super
	end
	
	def doMutate(node)
		replace(node.loc.selector, getReplacement(node.loc.selector.source))
	end 
end



