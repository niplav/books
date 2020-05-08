function serialize(o)
	if type(o)=="number" then
		io.write(string.format("%a", o))
	elseif type(o)=="string" then
		io.write(string.format("%q", o))
	elseif type(o)=="table" then
		io.write("{\n")
		for k,v in pairs(o) do
			io.write("	[")
			serialize(k)
			io.write("] = ")
			serialize(v)
			io.write(",\n")
		end
		io.write("}\n")
	else
		error("cannot serialize a " .. type(o))
	end
end

function quote(s)
	local n=-1
	for w in string.gmatch(s, "]=*]") do
		n=math.max(n, #w-2)
	end

	local eq=string.rep("=", n+1)

	return string.format(" [%s[\n%s]%s] ", eq, s, eq)
end
