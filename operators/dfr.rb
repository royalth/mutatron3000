require_relative '../mutator'

#DFR Dangerous Function Replacement

class DFR < Mutator
	@dMethodes = [
				'sort'
	]
	
	#zastanów się, może łatwiej tylko usuwać wykrzynkini
	
	def on_send(node)
		if @dMethodes.includes? node.loc.selector.source.tr('!', '')
			work(node)
		end	
		super
	end
	
	def doMutate(node)
		if node.loc.selector.source.tr('!', '') == node.loc.selector.source
			# no ! in the end, add it
			node.loc.selector.source += '!'
		else 
			node.loc.selector.source.tr!('!', '')
		end
	end
end
