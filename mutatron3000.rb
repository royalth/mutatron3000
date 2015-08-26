require_relative 'src/mutation_component'

class Mutatron3000 
	@mutation_operators
	@filename
	@testsuite_name
	
	def run(filename, testsuite_name)
		@mutation_operators = [ 'BNR', 'AOR', 'NOD', 'ROR', 'LCR', 'DFR', 'EOR', 'RNOR' ]
		@filename 			= filename
		@testsuite_name 	= testsuite_name
		create_mutants
		test_mutants
	end
	
	private 
	
	def create_mutants
		@mutation_operators.each do | op | 
			mutatron = MutationComponent.new(@filename, op)
			mutated = mutatron.mutate

			File.open( mutant_filename(op), 'w') {|f| f.write(mutated) }
		end 
		
		puts "Mutants generation completed. Mutants generated: #{@mutation_operators.size}"
	end
	
	def test_mutants 
		File.rename(@filename, @filename + '.bak')

		killed = 0
		errors = 0
		identical = 0
		@mutation_operators.each do | op | 
			print mutant_filename(op)
			
			if mutant_identical(op)
				identical += 1
				puts " IDENTICAL TO ORIGINAL (excluded from testing)"
				next
			end
		
			File.rename(mutant_filename(op), @filename)
			
			test_output = `ruby #{@testsuite_name} --runner console --verbose=progress`
			failed_tests = test_output.chomp.split('').count('F')
			
			print " " + test_output 
			
			if failed_tests > 0
				killed += 1
				puts " KILLED"
			else 
				puts " ALIVE"
			end
			
			File.rename(@filename, mutant_filename(op))
		end
		
		File.rename(@filename + '.bak', @filename)
		
		puts "Mutant testing completed."
		puts "	Mutants killed: #{killed}."
		puts "	Mutants identical to the original: #{identical}."
	end
	
	def mutant_identical(op)
		original = File.open(@filename + '.bak', "r")
		original_content = original.read
		original.close
		mutant = File.open(mutant_filename(op), "r")
		mutant_content = mutant.read
		mutant.close
		return original_content == mutant_content
	end
	
	def mutant_filename(op)
		return @filename + '_' + op
	end 
end


filename 		= ARGV[0]
testsuite_name	= ARGV[1]
if filename == nil || testsuite_name == nil
	puts "Usage: ruby mutatron3000.rb <path to tested file> <path to testsuite>"
	exit
end

mutatron3000 = Mutatron3000.new
mutatron3000.run(filename, testsuite_name)
