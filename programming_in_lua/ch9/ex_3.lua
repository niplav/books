function transfer(cr)
	coroutine.yield(cr)
end

function dispatch(b)
	nr=coroutine.create(b)
	while nr~=nil do
		nr=coroutine.resume(nr)
	end
end
