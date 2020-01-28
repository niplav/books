local N=3

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

function prefix(p)
	local s=p[1]
	for i=2, #p do s=s .. " " .. p[i] end
	return s
end

function back(p)
	for i=1, N-1 do p[i]=p[i+1] end
end

local statetab={}

function insert(index, value)
	local list=statetab[index]
	if list==nil then
		statetab[index]={value}
	else
		list[#list+1]=value
	end
end

local MAXGEN=10000
local NOWORD="\n"

pf={}
for i=1, N do pf[i]=NOWORD end

for w in allwords() do
	insert(prefix(pf), w)
	back(pf)
	pf[N]=w
end

insert(prefix(pf), NOWORD)

for i=1, N do pf[i]=NOWORD end

for i=1, MAXGEN do
	local ls=statetab[prefix(pf)]
	local r=math.random(#ls)
	local nextword=ls[r]
	if nextword==NOWORD then return end
	io.write(nextword, " ")
	back(pf)
	pf[N]=nextword
end
