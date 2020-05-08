function multiload(...)
	local t=table.pack(...)
	local i=1
	return load(function ()
		local res
		if i>#t then
			return nil
		end
		if type(t[i])=="string" then
			i=i+1
			return t[i-1]
		end
		while not res and i<=#t do
			res=t[i]()
			i=i+1
		end
		return res
	end)
end
