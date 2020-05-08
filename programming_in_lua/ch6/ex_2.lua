function newpoly(t)
	return function(x)
		local res=0
		for i=1, #t do
			res=res+t[i]*x^(#t-i)
		end
		return res
	end
end
