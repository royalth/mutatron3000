require 'parser/current'

# AOR Arithmetic Operator Replacement
class AOR < Parser::Rewriter 
	def initialize
		ops = [
			['+' , '-' ], 
			['-' , '+' ], 
			['*' , '/' ],
			['*' , '**'], 
			['/' , '*' ], 
			['/' , '%' ], 
			['**', '*' ], 
			['%' , '/' ], 
			['%' , '*' ] 	
		]
		random = Random.new
		id = random.rand(ops.size)
		@from = ops[id][0]
		@to = ops[id][1]
	end
	
	def on_send(node)
		if node.loc.selector.source == @from
			replace(node.loc.selector, @to)
		end 
		super
	end
end

