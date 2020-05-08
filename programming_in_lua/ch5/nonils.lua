function nonils(...)
	local arg=table.pack(...)
	for i=1, arg.n do
		if arg[i]==nil then return false end
	end
	return true
end
