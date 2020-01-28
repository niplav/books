function substrings(s)
	local len, pos
	len=0
	pos=1
	return function()
		if pos+len>#s then
			pos=pos+1
			len=0
		end
		if pos>#s then
			return nil
		else
			local str=string.sub(s, pos, pos+len)
			len=len+1
			return str
		end
	end
end
