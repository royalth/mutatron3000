require_relative '../mutation_operator'

#RNOR Range Operator Replacement

class RNOR < MutationOperator
	def on_irange(node)
		work(node)
		super
	end
	
	def on_erange(node)
		work(node)
		super
	end
	
	def doMutate(node)
		if node.loc.operator.source == '..'
			replace node.loc.operator, '...'
		else 
			replace node.loc.operator, '..'
		end
	end
end
