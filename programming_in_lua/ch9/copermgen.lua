function permgen(a, n)
	n=n or #a
	if n<=1 then
		coroutine.yield(a)
	else
		for i=1, n do
			a[n], a[i]=a[i], a[n]
			permgen(a, n-1)
			a[n], a[i]=a[i], a[n]
		end
	end
end

function permutations(a)
	return coroutine.wrap(function() permgen(a) end)
end

function printres(a)
	for i=1, #a do
		io.write(a[i], " ")
	end
	io.write("\n")
end
