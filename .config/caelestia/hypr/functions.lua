local function move_by_screen(x, y)
	local screen = hl.get_active_monitor()
	if screen and type(screen.width) == "number" and type(screen.height) == "number" then
		local w = (screen.width * (x / 100)) or 0
		local h = (screen.height * (y / 100)) or 0

		return { x = w, y = h, relative = true }
	end
end

return {
	move_by_screen = move_by_screen,
}
