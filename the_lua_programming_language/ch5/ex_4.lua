function combi(t, n)
	local arg={}
	local res={}
	local save={}

	if n<=0 then
		return {{}}
	end

	for k, v in ipairs(t) do save[k]=v end

	while #save>0 do
		local last=save[#save]
		save[#save]=nil

		for k, v in ipairs(save) do table.insert(arg, v) end

		local tmp=combi(arg, n-1)
		arg={}

		for i=1, #tmp do table.insert(tmp[i], last) end
		for k, v in ipairs(tmp) do table.insert(res, v) end
	end
	return res
end

function comb(t)
	local res={}
	for i=1, #t do
		tmp=combi(t, i)
		for k, v in ipairs(tmp) do table.insert(res, tmp[k]) end
	end
	return res
end
