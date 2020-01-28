-- It's stupid to set both values to 0. This just restores the first state.

queue={}

function queue.new()
	return {first=0, last=-1}
end

function queue.pushfirst(q, value)
	q[q.first]=value
	q.first=q.first+1
end

function queue.pushlast(q, value)
	q[q.last]=value
	q.last=q.last-1
end

function queue.popfirst(q)
	local first=q.first-1
	if q.last>first then error("queue is empty") end
	local value=q[first]
	q[first]=nil
	q.first=first
	if q.last>=q.first-1 then q.first=0; q.last=-1 end
	return value
end

function queue.poplast(q)
	local last=q.last+1
	if last>q.first then error("queue is empty") end
	local value=q[last]
	q[last]=nil
	q.last=last
	if q.last>=q.first-1 then q.first=0; q.last=-1 end
	return value
end
