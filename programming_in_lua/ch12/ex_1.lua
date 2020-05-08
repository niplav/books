function serialize(o, l)
	l=l or 1
	if type(o)=="number" then
		io.write(string.format("%a", o))
	elseif type(o)=="string" then
		io.write(string.format("%q", o))
	elseif type(o)=="table" then
		io.write("{\n")
		for k, v in pairs(o) do
			io.write(string.rep("\t", l))
			serialize(k, l+1)
			io.write("=")
			serialize(v, l+1)
			io.write(",\n")
		end
		io.write(string.rep("\t", l-1) .. "}")
		if l==1 then io.write("\n") end
	else
		error("cannot serialize a " .. type(o))
	end
end
