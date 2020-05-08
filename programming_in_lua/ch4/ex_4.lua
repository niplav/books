local z = 0
local c

repeat
	c = io.read()
	if c == '0' then z=z+1 end
	print(z)
until c == nil

if z % 2 == 0 then
	print('ok')
else
	print('not ok')
end
