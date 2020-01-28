function showarg(func, ...)
	print("calling "..tostring(func)..":", ...)
	func(...)
end
