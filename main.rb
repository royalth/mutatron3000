require_relative "mutatron"

filename 	= ARGV[0]
mutator 	= ARGV[1]

if filename == nil || mutator == nil
	puts "You forgot about file name and mutation operator!"
	exit
end

mutatron = Mutatron.new(filename, mutator)
mutated = mutatron.mutate

File.open( filename + '_mut', 'w') {|f| f.write(mutated) }

puts "done!"
