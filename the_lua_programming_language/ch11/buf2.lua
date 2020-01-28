local t={}
for line in io.lines() do
	t[#t+1]=line .. "\n"
end
local s=table.concat(t)
