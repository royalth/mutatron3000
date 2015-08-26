require_relative '../mutation_operator'

#EOR Equality Operator Replacement

class EOR < MutationOperator
	def on_send(node)
		if ['eql?', 'equals?'].include? node.loc.selector.source
			work(node)
		end
	end
	
	def doMutate(node) 
		if node.loc.selector.source == 'eql?'
			replace node.loc.selector, 'equals?'
		else 
			replace node.loc.selector, 'eql?'
		end
	end
end
