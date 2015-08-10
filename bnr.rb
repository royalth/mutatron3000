require_relative 'mutator'

# BNR Break Next Replacement

class BNR < Mutator
	def on_break(node)
		work(node)
		super
	end
	def doMutate(node)
		replace(node.loc.keyword, "next")
	end
end

