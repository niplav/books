function combgen(t, n, r, i)
	local idx=i or 1
	local res=r or {}

	if n<=0 then
		coroutine.yield(res)
	else
		for j=idx, #t-n do
			res[n]=t[j]
			combgen(t, n-1, res, j+1)
		end
	end
end

function combinations(t, n)
	return coroutine.wrap(function() combgen(t, n) end)
end
