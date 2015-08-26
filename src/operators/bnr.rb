require_relative '../mutation_operator'

# BNR Break Next Replacement

class BNR < MutationOperator
	def on_break(node)
		work(node)
		super
	end
	def doMutate(node)
		replace(node.loc.keyword, "next")
	end
end

