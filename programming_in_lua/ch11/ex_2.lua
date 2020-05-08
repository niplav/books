-- using a closure for the allwords argument

local function allwords(f)
	local auxwords=function()
		for line in io.lines(f) do
			for word in string.gmatch(line, "%w+") do
				coroutine.yield(word)
			end
		end
	end
	return coroutine.wrap(auxwords)
end

local ignore={}
for w in allwords(arg[2] or "ignore") do
	ignore[w]=true
end

local counter={}
for w in allwords() do
	if not ignore[w] then
		counter[w]=(counter[w] or 0) + 1
	end
end

local words={}
for w in pairs(counter) do
	words[#words+1]=w
end

table.sort(words, function(w1, w2)
	return counter[w1]>counter[w2] or
		counter[w1]==counter[w2] and w1<w2
end)

for i=1, (tonumber(arg[1]) or 10) do
	print(words[i], counter[words[i]])
end
