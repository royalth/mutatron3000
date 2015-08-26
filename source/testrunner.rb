# running tests

testsuite = "testsuite.rb"
test_output = exec "ruby #{testsuite} --runner console --verbose=progress"

failed_tests = test_output.chomp.split('').count('F')
passed_tests = test_output.chomp.split('').count('.')

puts "P: #{passed_tests}, F: #{failed_tests}"
 
