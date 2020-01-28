-- s is definitely a string
-- c can be a string or a function

function loadwithprefix(s, c)
	return load(function ()
		local t
		if s then
			t=s
			s=nil
		elseif type(c)=="string" then
			t=c
			c=nil
		elseif type(c)=="function" then
			t=c()
		end
		return t
	end)
end
