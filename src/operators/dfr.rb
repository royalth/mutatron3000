require_relative '../mutation_operator'

#DFR Dangerous Function Replacement

class DFR < MutationOperator
	def on_send(node)
		src = node.loc.selector.source
		if src[src.length-1] == '!'
			work(node)
		end	
		super
	end
	
	def doMutate(node)
		replace(node.loc.selector, node.loc.selector.source.tr('!', ''))
	end
end
