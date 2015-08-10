require 'parser/current'

#LCR Logical Connector Replacement
class LCR < Parser::Rewriter 
	def on_and(node)
		replace node.location.operator, '||'
		super
	end
	def on_or(node)
		replace node.location.operator, '&&'
		super
	end
end

