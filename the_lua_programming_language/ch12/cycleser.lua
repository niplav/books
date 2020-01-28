function basicser(o)
	if type(o)=="number" then
		return tostring(o)
	else
		return string.format("%q", o)
	end
end

function save(name, value, saved)
	saved=saved or {}
	io.write(name, " = ")
	if type(value)=="number" or type(value)=="string" then
		io.write(basicser(value), "\n")
	elseif type(value)=="table" then
		if saved[value] then
			io.write(saved[value], "\n")
		else
			saved[value]=name
			io.write("{}\n")
			for k,v in pairs(value) do
				k=basicser(k)
				local fname=string.format("%s[%s]", name, k)
				save(fname, v, saved)
			end
		end
	else
		error("cannot save a " .. type(value))
	end
end
