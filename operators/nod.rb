require_relative '../mutator'

#NOD Negation Operator Deletion
class NOD < Mutator
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
