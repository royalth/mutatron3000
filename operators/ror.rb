require 'replacements'

#ROR Relation Operator Replacement

class ROR < OR
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
end



