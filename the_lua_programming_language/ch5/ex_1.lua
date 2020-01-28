function concat(...)
	local args={...}
	local r=""
	for i, v in ipairs(args) do
		r=r..v
	end
	return r
end
