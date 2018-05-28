hs.hotkey.bind( { "cmd", "alt", "ctrl" }, "Left", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen_size = win:screen():frame()

	frame.x = screen_size.x
	frame.y = screen_size.y
	frame.w = screen_size.w / 2
	frame.h = screen_size.h
	win:setFrame( frame )
end )

hs.hotkey.bind( { "cmd", "alt", "ctrl" }, "Right", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen_size = win:screen():frame()

	frame.x = screen_size.x + ( screen_size.w / 2 )
	frame.y = screen_size.y
	frame.w = screen_size.w / 2
	frame.h = screen_size.h
	win:setFrame( frame )
end )

hs.hotkey.bind( { "cmd", "alt", "ctrl" }, "Up", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen_size = win:screen():frame()

	frame.x = screen_size.x
	frame.y = screen_size.y
	frame.w = screen_size.w
	frame.h = screen_size.h / 2
	win:setFrame( frame )
end )

hs.hotkey.bind( { "cmd", "alt", "ctrl" }, "Down", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen_size = win:screen():frame()

	frame.x = screen_size.x
	frame.y = screen_size.y + ( screen_size.h / 2 )
	frame.w = screen_size.w
	frame.h = screen_size.h / 2
	win:setFrame( frame )
end )
