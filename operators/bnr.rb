require_relative '../mutator'
require_relative '../counter'


# BNR Break Next Replacement
class BnrCounter < Counter
	def on_break(node)
		addInstance
		super
	end
end

class BnrMutator < Mutator
	def on_break(node)
		if (mutateHere?)
			replace(node.loc.keyword, "next")
		super
	end
end

