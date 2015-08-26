require 'test/unit'
require_relative 'code1'

class TestA < Test::Unit::TestCase
	def testFunc1_1
		a = A.new(10)
		a.func1(3, 5)
		assert_equal 64, a.var1
	end
	def testFunc1_2
		a = A.new(10)
		a.func1(4, 4)
		assert_equal 10, a.var1
	end
	def testFunc2_1
		a = A.new(10)
		assert_equal 2, a.func2(2, 5)
	end
	def testFun3_1
	
	end
	def testFun4_1
		a = A.new(0)
		a.func4(4, false)
		assert_equal 4, a.var1
	end
end

