require 'parser/current'

# BNR Break Next Replacement
class BNR < Parser::Rewriter 
	def on_break(node)
		replace(node.loc.keyword, "next")
		super
	end
end

