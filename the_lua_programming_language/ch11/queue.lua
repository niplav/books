queue={}

function queue.new()
	return {first=0, last=-1}
end

function queue.pushfirst(q, value)
	local first=q.first-1
	q.first=first
	q[first]=value
end

function queue.pushlast(q, value)
	local last=q.last+1
	q.last=last
	q[last]=value
end

function queue.popfirst(q)
	local first=q.first
	if first>q.last then error("queue is empty") end
	local value=q[first]
	q[first]=nil
	q.first=first+1
	return value
end

function queue.poplast(q)
	local last=q.last
	if q.first>last then error("queue is empty") end
	local value=q[last]
	q[last]=nil
	q.last=last-1
	return value
end
