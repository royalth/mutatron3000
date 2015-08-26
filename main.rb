require_relative 'mutatron'

class Mutatron3000 
	@mutation_operators
	@filename
	@testsuite_name
	
	def run(filename, testsuite_name)
		#@mutation_operators = [ 'BNR', 'AOR', 'NOD', 'ROR', 'LCR', 'DFR', 'EOR', 'RNOR' ]
		@mutation_operators = [ 'AOR' ]
		@filename 			= filename
		@testsuite_name 	= testsuite_name
		create_mutants
		test_mutants
	end
	
	private 
	
	def create_mutants
		@mutation_operators.each do | op | 
			mutatron = Mutatron.new(@filename, op)
			mutated = mutatron.mutate

			File.open( mutant_filename(op), 'w') {|f| f.write(mutated) }
		end 
		
		puts "Mutants generation completed. Mutants generated: #{@mutation_operators.size}"
	end
	
	def test_mutants 
		# zmień nazwę pliku na *.bak
		File.rename(@filename, @filename + '.bak')

		killed = 0;
		@mutation_operators.each do | op | 
			File.rename(mutant_filename(op), @filename)
			
			test_output = exec "ruby #{@testsuite_name} --runner console --verbose=progress"
			failed_tests = test_output.chomp.split('').count('F')
			puts mutant_filename(op)
			if failed_tests > 0
				killed += 1
				puts "KILLED"
			else 
				puts "ALIVE"
			end
			
			File.rename(@filename, mutant_filename(op))
		end
		
		puts "Mutant testing completed. Mutants killed: #{killed}."
	end
	
	def mutant_filename(op)
		return @filename + '_' + op
	end 
end


filename 		= ARGV[0]
testsuite_name	= ARGV[1]
if filename == nil || testsuite_name == nil
	puts "Usage: ruby main.rb <filename> <testsuite_name>"
	exit
end

mutatron3000 = Mutatron3000.new
mutatron3000.run(filename, testsuite_name)


# dla każdego mutanta (iteracja po mutation_operators)
#zmień jego nazwę na główna nazwę 
# zapusć testy
# jeśli chociaż jeden fail - zabity
# wypisz ze zabity
#zmień nazwę z powrotem

#zmień nazwę mutatrona i mutatora
