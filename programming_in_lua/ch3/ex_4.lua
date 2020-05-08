function polyeval(a, x)
	local res=0
	for i=1, #a do
		res=res*x
		res=res+a[i]
	end
	return res
end
