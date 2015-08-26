require_relative "operators"

class MutationComponent
	@buffer
	@ast
	@operator
	def initialize(filename, mutation_operator_name) 
		@buffer 	= Parser::Source::Buffer.new(filename).read
		parser	 	= Parser::CurrentRuby.new
		@operator	= Kernel.const_get(mutation_operator_name).new
		@ast     	= parser.parse(@buffer)
	end
	def mutate
		return @operator.mutation(@buffer, @ast)
	end
end

