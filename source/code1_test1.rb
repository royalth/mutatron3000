require 'test/unit'
require_relative 'code1'

class TestA < Test::Unit::TestCase
	def testFunc1_1
		a = A.new(10)
		a.func1(3, 5)
		assert_equal(64, a.var1)
	end
	def testFunc1_2
		a = A.new(10)
		a.func1(4, 4)
		assert_equal(10, a.var1)
	end
end
