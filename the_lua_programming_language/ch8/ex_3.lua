--the two functions have nearly the same speed

function stringrep_n(n)
	local res=[[	s=...
	local r=""
]]
	if n>0 then
		while n>1 do
			if n%2~=0 then res=res .. "\tr=r .. s\n" end
			res=res .. "\ts=s .. s\n"
			n=math.floor(n/2)
		end
		res=res .. "\tr=r .. s\n"
	end
	res=res .. "\treturn r\n"
	return load(res)
end
