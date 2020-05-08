function uniquewords()
	local line=io.read()
	local wordtable={}
	local pos=1
	wordtable[""]=1
	return function()
		local str=""
		local s, e
		repeat
			s, e=string.find(line, "%w+", pos)
			if s then
				pos=e+1
				str=str.sub(line, s, e)
			else
				line=io.read()
				pos=1
			end
		until not line or wordtable[str]~=1
		wordtable[str]=1
		return (line and str) or nil
	end
end
