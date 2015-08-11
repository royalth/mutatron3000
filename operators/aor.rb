require_relative 'replacements'

# AOR Arithmetic Operator Replacement

class AOR < OR
	def initialize 
		@ops = ['+' , '-', '*' , '/', '**', '%']
		@rep = {
			'+' 	=> ['-'], 
			'-' 	=> ['+'],
			'*'		=> ['/', '**'], 
			'/' 	=> ['*' , '%'],
			'**'	=> ['*'], 
			'%'		=> ['/' , '*']
		}
		super 
	end
end


