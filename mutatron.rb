require_relative 'mutator2'

class Mutatron
	@buffer, @ast, @mutator
	def initalize(filename, mutatorName) 
		@buffer 	= Parser::Source::Buffer.new(filename).read
		parser	 	= Parser::CurrentRuby.new
		@ast     	= parser.parse(buffer)
		@mutator	= Kernel.const_get(mutatorName).new
	end
	def mutate
		return mutator.mutation(buffer, ast)
	end
end
