local N=8

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

local function isplaceok(a, n, c)
        for i=1, n-1 do
                if (a[i]==c) or
                   (a[i]-i==c-n) or
                   (a[i]+i==c+n) then
                        return false
                end
        end
        return true
end

local function printsolution(a)
        for i=1, N do
                for j=1, N do
                        io.write(a[i]==j and "X" or "-", " ")
                end
                io.write("\n")
        end
        io.write("\n")
end

for q in permutations({1, 2, 3, 4, 5, 6, 7, 8}) do
	local i=1
	while i<N+1 and isplaceok(q, i, q[i]) do i=i+1 end
	if i==N+1 then printsolution(q) end
end
