local function change_keymap(keymap, message)
	return function()
		hl.dispatch(hl.dsp.submap(keymap))
		hl.dispatch(hl.dsp.exec_cmd("caelestia shell toaster info KeyBinds " .. message .. " Keyboard"))
	end
end
local function exec_and_return(cmd)
	return function()
		hl.dispatch(hl.dsp.exec_cmd(cmd))
		change_keymap("custom", "'Custom Keybinds'")()
	end
end
local function minimize_to_special(special_workspace)
	return function()
		local win = hl.get_active_window()
		if not win then
			return
		end
		if win.workspace.name == "special:" .. special_workspace then
			hl.dispatch(hl.dsp.window.move({ workspace = "e+0", follow = true }))
		else
			hl.dispatch(hl.dsp.window.move({ workspace = "special:" .. special_workspace, follow = false }))
		end
	end
end

return {
	change_keymap = change_keymap,
	exec_and_return = exec_and_return,
	minimize_to_special = minimize_to_special,
}
