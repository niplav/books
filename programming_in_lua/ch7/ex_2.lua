function fromto(n, m, s)
	return fromit, {m, s}, n-s
end

function fromit(t, v)
	if v+t[2]<=t[1] then
		return v+t[2]
	else
		return nil
	end
end

