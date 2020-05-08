n=100000

function f()
	print(n)
	n=n-1
	if n<0 then
		return nil
	else
		return "i=1;"
	end
end

load(f)()
