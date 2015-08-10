require 'replacements'

# AOR Arithmetic Operator Replacement

class AOR < OR
	@ops = ['+' , '-', '*' , '/', '**', '%']
	@rep = {
		'+' 	=> ['-'], 
		'-' 	=> ['+'],
		'*'		=> ['/', '**'], 
		'/' 	=> ['*' , '%'],
		'**'	=> ['*'], 
		'%'		=> ['/' , '*']
	}
end


