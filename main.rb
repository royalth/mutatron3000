require 'parser/current'
require_relative 'operators'

filename = ARGV[0]
mutatron = ARGV[1]

if filename == nil || mutatron == nil
	puts "You forgot about file name and mutation operator!"
	exit
end

buffer 	= Parser::Source::Buffer.new(filename).read
parser 	= Parser::CurrentRuby.new
ast      = parser.parse(buffer)

mutatron = Kernel.const_get(mutatron).new

mutated = mutatron.rewrite(buffer, ast)
File.open("mut_" + buffer.name, 'w') {|f| f.write(mutated) }

puts "done!"
