require_relative "operators"

class Mutatron
	@buffer
	@ast
	@mutator
	def initialize(filename, mutatorName) 
		@buffer 	= Parser::Source::Buffer.new(filename).read
		parser	 	= Parser::CurrentRuby.new
		@ast     	= parser.parse(@buffer)
		@mutator	= Kernel.const_get(mutatorName).new
	end
	def mutate
		return @mutator.mutation(@buffer, @ast)
	end
end
