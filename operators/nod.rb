require 'parser/current'

#NOD Negation Operator Deletion
class NOD < Parser::Rewriter
	def on_send(node) 
		if node.loc.selector.source == "not" || node.loc.selector.source == "!"
			remove node.loc.selector
		end
		super
	end
end

