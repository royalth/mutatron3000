require_relative '../mutation_operator'

#LCR Logical Connector Replacement
class LCR < MutationOperator
	def on_and(node)
		work(node)
		super
	end
	
	def on_or(node)
		work(node)
		super
	end

	def doMutate(node)
		if ['and', '&&'].include? node.location.operator.source
			replace node.location.operator, '||'
		else 
			replace node.location.operator, '&&'
		end
	end
end
