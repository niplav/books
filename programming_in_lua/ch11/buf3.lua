local t={}
for line in io.lines() do
	t[#t+1]=line
end
t[#t]+1=""
local s=table.concat(t, "\n")
