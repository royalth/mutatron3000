require_relative 'replacements'

#ROR Relation Operator Replacement

class ROR < OR
	def initialize
		@ops = ['<' , '>', '<=' , '>=', '==', '!=', '<=>']
		@rep = {
			'<' 	=> ['>', '<='], 
			'>' 	=> ['<', '>='],
			'<='	=> ['>=', '<', '<=>'], 
			'>=' 	=> ['<=', '>'],
			'=='	=> ['!='], 
			'!='	=> ['=='], 
			'<=>' 	=> ['<=']
		}
		super
	end
end



