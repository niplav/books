function polyeval(a, x)
	local res=0
	for i=1, #a do
		res=res+a[i]*x^(i-1)
	end
	return res
end
