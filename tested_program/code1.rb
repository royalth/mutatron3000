
class A 
	@var1
	def initialize(var1)
		@var1 = var1
	end
	
	def var1 
		@var1
	end
	
	def func1(a, b)
		@var1 = @var1 + a - b
		if (a >= b) 
			@var1 = @var1 * (a / b)
		else 
			@var1 = @var1 ** (b % a)
		end
	end
	
	def func2(a, b)
		res = 0;
		for i in a..b
			if (i == 4 && a > 1)
				break;
			end 
			res += 1
		end
		return res
	end
	
	def func3(a, b, x)
		v = [4, 3, 2, a, b]
		v.sort!
		if not x
			return v[0] 
		else 
			return v[1]
		end
	end
	
	def func4(a, b)
		while !b && a > 0
			if (a < 5)
				@var1 = 4
				break
			else 
				a -= 1
			end
		end
	end
end
