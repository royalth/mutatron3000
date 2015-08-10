require '../mutator'

#NOD Negation Operator Deletion
class NOD < Mutator
	def on_send(node)
		if ['not', '!'].includes? node.loc.selector.source
			work(node)
		end
		super
	end
	
	def doMutate(node)
		remove node.loc.selector
	end
end
