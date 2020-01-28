function window(options)
	if type(options.title) ~= "string" then
		error("no title")
	elseif type(options.width) ~= "number" then
		error("no width")
	elseif type(options.height) ~= "number" then
		error("no height")
	end

	_window(options.title,
		options.x or 0,
		options.y or 0,
		options.width,
		options.height,
		options.background or "white",
		options.border
	)
end
