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
			if type(k)~="string" or not isidentifier(k) then io.write("[") end
			if type(k)=="string" and isidentifier(k) then io.write(k)
			else serialize(k, l+1) end
			if type(k)~="string" or not isidentifier(k) then io.write("]") end
			io.write(" = ")
			serialize(v, l+1)
			io.write(",\n")
		end
		io.write(string.rep("\t", l-1) .. "}")
		if l==1 then io.write("\n") end
	else
		error("cannot serialize a " .. type(o))
	end
end

function isidentifier(s)
	return string.match(s, "^[a-zA-Z_][a-zA-Z0-9_]*$")
end
