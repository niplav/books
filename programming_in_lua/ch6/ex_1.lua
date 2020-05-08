function integral(f)
	return function(x, y)
		local i, res, eps
		res=0; eps=0.001
		for i=x, y, eps do
			res=res+f(i)*eps
		end
		return res
	end
end
