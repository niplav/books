function allwords()
	local line=io.read()
	local pos=1
	return function()
		while line do
			local s, e=string.find(line, "%w+", pos)
			if s then
				pos=e+1
				return string.sub(line, s, e)
			else
				line=io.read()
				pos=1
			end
		end
		return nil
	end
end
