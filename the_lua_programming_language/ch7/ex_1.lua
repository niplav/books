function fromto(n, m)
	return fromit, {m}, n-1
end

function fromit(t, v)
	if v<t[1] then
		return v+1
	else
		return nil
	end
end
