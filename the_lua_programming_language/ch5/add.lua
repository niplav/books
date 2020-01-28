function tadd(a)
	local sum=0
	for i=1, #a do
		sum=sum+a[i]
	end
	return sum
end

function vadd(...)
	local s=0
	for i, v in ipairs{...} do
		s=s+v
	end
	return s
end
