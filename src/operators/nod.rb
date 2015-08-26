require_relative '../mutation_operator'

#NOD Negation Operator Deletion
class NOD < MutationOperator
	def on_send(node)
		if ['not', '!'].include? node.loc.selector.source
			work(node)
		end
		super
	end
	
	def doMutate(node)
		remove node.loc.selector
	end
end
