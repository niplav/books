function allbutone(...)
	local r={}
	local args=table.pack(...)
	for i=2, args.n do
		r[i-1]=args[i]
	end
	return table.unpack(r)
end
