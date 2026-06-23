local fn = require("hyprland.functions")
local fn1 = require("hypr.functions")
local vars = require("variables")

-- variables
local home = os.getenv("HOME")
local color = "cat " .. home .. "/.local/state/caelestia/sequences.txt"
local scriptDir = home .. "/.local/bin"
local footConf = home .. "/.config/foot/footfzf.ini"
local kbCustomBinds = "CTRL + ALT + semicolon"

-- changing from caelestia to custom keymap
hl.bind(kbCustomBinds, hl.dsp.exec_cmd("caelestia shell toaster info KeyBinds 'Custom KeyBinds' Keyboard"))
hl.bind(kbCustomBinds, hl.dsp.submap("custom"))

-- defining custom submap
hl.define_submap("custom", function()
	--  shell
	hl.bind("SUPER + super_l", hl.dsp.global("caelestia:launcher"), { release = true })
	hl.bind(
		"SUPER + CTRL + R",
		hl.dsp.exec_cmd("qs -c caelestia kill; sleep .1; caelestia shell -d"),
		{ release = true }
	)

	-- misc
	hl.bind("SUPER + ALT + c", hl.dsp.global("caelestia:clearNotifs"), { locked = true })
	hl.bind("CTRL + ALT + delete", hl.dsp.global("caelestia:session"))
	hl.bind("SUPER + slash", hl.dsp.global("caelestia:lock"))
	hl.bind("SUPER + SHIFT + slash", hl.dsp.exec_cmd(vars.sleepGestureCmd), { locked = true })

	-- brightness & temperature
	hl.bind("XF86MonBrightnessUp", hl.dsp.global("caelestia:brightnessUp"), { locked = true })
	hl.bind("XF86MonBrightnessDown", hl.dsp.global("caelestia:brightnessDown"), { locked = true })
	hl.bind("SUPER + CTRL + bracketLeft", hl.dsp.global("caelestia:brightnessUp"), { locked = true })
	hl.bind("SUPER + CTRL + apostrophe", hl.dsp.global("caelestia:brightnessDown"), { locked = true })
	hl.bind(
		"SUPER + SHIFT + bracketleft",
		hl.dsp.exec_cmd("hyprctl hyprsunset temperature +250"),
		{ repeating = true, locked = true }
	)
	hl.bind(
		"SUPER + SHIFT + apostrophe",
		hl.dsp.exec_cmd("hyprctl hyprsunset temperature -250"),
		{ repeating = true, locked = true }
	)
	hl.bind("SUPER + SHIFT + bracketright", hl.dsp.exec_cmd("hyprctl hyprsunset temperature 6000"), { locked = true })

	-- media
	hl.bind("XF86AudioPlay", hl.dsp.global("caelestia:mediaToggle"), { locked = true })
	hl.bind("XF86AudioNext", hl.dsp.global("caelestia:mediaNext"), { locked = true })
	hl.bind("XF86AudioPrev", hl.dsp.global("caelestia:mediaPrev"), { locked = true })
	hl.bind("XF86AudioStop", hl.dsp.global("caelestia:mediaStop"), { locked = true })

	local media = scriptDir .. "/media "
	hl.bind("SUPER + ALT + bracketright", hl.dsp.exec_cmd(media .. "play-pause"), { locked = true })
	hl.bind("SUPER + ALT + backslash", hl.dsp.exec_cmd(media .. "next"), { locked = true })
	hl.bind("SUPER + ALT + semicolon", hl.dsp.exec_cmd(media .. "previous"), { locked = true })
	hl.bind("SUPER + ALT + bracketleft", hl.dsp.exec_cmd(media .. "volume +5"), { locked = true })
	hl.bind("SUPER + ALT + apostrophe", hl.dsp.exec_cmd(media .. "volume -5"), { locked = true })
	hl.bind("SUPER + ALT + slash", hl.dsp.exec_cmd(media .. "loop"), { locked = true })
	hl.bind("SUPER + ALT + equal", hl.dsp.exec_cmd(media .. "choose"))

	-- workspace
	for i = 1, 10 do
		local key = i % 10
		hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind("SUPER + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
		hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
	end
	hl.bind("SUPER + d", hl.dsp.focus({ workspace = "empty" }))
	hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "-1" }))
	hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "+1" }))
	hl.bind("SUPER + left", hl.dsp.focus({ workspace = "-1" }))
	hl.bind("SUPER + right", hl.dsp.focus({ workspace = "+1" }))

	--  window actions
	hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
	hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
	hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
	hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))
	hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
	hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
	hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
	hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
	hl.bind("SUPER + tab", hl.dsp.window.cycle_next({ next = false }))
	hl.bind("SUPER + SHIFT + tab", hl.dsp.window.cycle_next({ next = true }))
	hl.bind("SUPER + f", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
	hl.bind("SUPER + SHIFT + f", hl.dsp.window.fullscreen({ mode = "maximized" }))
	hl.bind("SUPER + v", hl.dsp.window.float({}))
	hl.bind("SUPER + SHIFT + d", hl.dsp.layout("togglesplit"))
	hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
	hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
	hl.bind("SUPER + u", function()
		local a = hl.get_active_window()
		if a then
			local pip = fn.move_actions(a) or {}
			table.insert(pip, 1, hl.dsp.window.float())
			table.insert(pip, hl.dsp.window.pin({ window = "address:" .. a.address }))

			for _, x in ipairs(pip) do
				hl.dispatch(x)
			end
		end
	end)
	hl.bind("SUPER + p", hl.dsp.window.pin())
	hl.bind("SUPER + q", hl.dsp.window.close())
	hl.bind("SUPER + SHIFT + q", hl.dsp.window.kill())
	hl.bind("SUPER + g", hl.dsp.group.toggle())
	hl.bind("SUPER + SHIFT + g", hl.dsp.window.move({ out_of_group = true }))
	hl.bind("SUPER + ALT + g", hl.dsp.group.lock_active())
	hl.bind("ALT + tab", hl.dsp.group.next(), { repeating = true })
	hl.bind("ALT + SHIFT + tab", hl.dsp.group.prev(), { repeating = true })

	-- resize submap
	hl.bind("SUPER + SHIFT + r", hl.dsp.exec_cmd("caelestia shell toaster info KeyBinds 'Resize KeyBinds' Keyboard"))
	hl.bind("SUPER + SHIFT + r", hl.dsp.submap("resize"))
	hl.define_submap("resize", function()
		hl.bind("f", hl.dsp.window.float({}))
		hl.bind("left", hl.dsp.window.resize(fn.resize_active_window(-5, 0)), { repeating = true })
		hl.bind("right", hl.dsp.window.resize(fn.resize_active_window(5, 0)), { repeating = true })
		hl.bind("up", hl.dsp.window.resize(fn.resize_active_window(0, 5)), { repeating = true })
		hl.bind("down", hl.dsp.window.resize(fn.resize_active_window(0, -5)), { repeating = true })
		hl.bind("h", hl.dsp.window.resize(fn.resize_active_window(-5, 0)), { repeating = true })
		hl.bind("l", hl.dsp.window.resize(fn.resize_active_window(5, 0)), { repeating = true })
		hl.bind("k", hl.dsp.window.resize(fn.resize_active_window(0, 5)), { repeating = true })
		hl.bind("j", hl.dsp.window.resize(fn.resize_active_window(0, -5)), { repeating = true })
		hl.bind("SHIFT + left", hl.dsp.window.move(fn1.move_by_screen(-5, 0)), { repeating = true })
		hl.bind("SHIFT + right", hl.dsp.window.move(fn1.move_by_screen(5, 0)), { repeating = true })
		hl.bind("SHIFT + up", hl.dsp.window.move(fn1.move_by_screen(0, -5)), { repeating = true })
		hl.bind("SHIFT + down", hl.dsp.window.move(fn1.move_by_screen(0, 5)), { repeating = true })
		hl.bind("SHIFT + h", hl.dsp.window.move(fn1.move_by_screen(-5, 0)), { repeating = true })
		hl.bind("SHIFT + l", hl.dsp.window.move(fn1.move_by_screen(5, 0)), { repeating = true })
		hl.bind("SHIFT + k", hl.dsp.window.move(fn1.move_by_screen(0, -5)), { repeating = true })
		hl.bind("SHIFT + j", hl.dsp.window.move(fn1.move_by_screen(0, 5)), { repeating = true })
		hl.bind("escape", hl.dsp.exec_cmd("caelestia shell toaster info KeyBinds 'Custom KeyBinds' Keyboard"))
		hl.bind("escape", hl.dsp.submap("custom"))
	end)

	-- special workspace
	hl.bind("SUPER + s", hl.dsp.workspace.toggle_special("special"))
	hl.bind("SUPER + m", hl.dsp.workspace.toggle_special("music"))
	hl.bind("SUPER + c", hl.dsp.workspace.toggle_special("communication"))
	hl.bind("SUPER + t", hl.dsp.workspace.toggle_special("todo"))
	hl.bind("SUPER + n", hl.dsp.workspace.toggle_special("notes"))
	hl.bind("SUPER + SHIFT + s", hl.dsp.window.move({ workspace = "special", follow = false }))
	hl.bind("SUPER + SHIFT + m", hl.dsp.window.move({ workspace = "music", follow = false }))
	hl.bind("SUPER + SHIFT + c", hl.dsp.window.move({ workspace = "communication", follow = false }))
	hl.bind("SUPER + SHIFT + t", hl.dsp.window.move({ workspace = "todo", follow = false }))
	hl.bind("SUPER + SHIFT + n", hl.dsp.window.move({ workspace = "notes", follow = false }))

	-- apps
	hl.bind("SUPER + return", hl.dsp.exec_cmd(vars.terminal))
	hl.bind("SUPER + b", hl.dsp.exec_cmd(vars.browser))
	hl.bind("SUPER + SHIFT + b", hl.dsp.exec_cmd(vars.browser .. "--private-window"))
	hl.bind("SUPER + e", hl.dsp.exec_cmd(vars.fileExplorer))
	hl.bind("SUPER + SHIFT + e", hl.dsp.exec_cmd("foot -e sh -c '" .. color .. "; yazi'"))
	hl.bind("SUPER + ALT + v", hl.dsp.exec_cmd(vars.audioSettings))
	hl.bind("CTRL + SHIFT + escape", hl.dsp.exec_cmd("foot -a 'btop' -e sh -c '" .. color .. "; btop'"))

	-- utilities
	hl.bind("print", hl.dsp.exec_cmd("caelestia screenshot"), { locked = true })
	hl.bind("SHIFT + print", hl.dsp.global("caelestia:screenshotFreeze"))
	hl.bind("SUPER + print", hl.dsp.exec_cmd("caelestia record -s"))
	hl.bind("CTRL + print", hl.dsp.exec_cmd("caelestia record"))
	hl.bind("CTRL + SHIFT + print", hl.dsp.exec_cmd("caelestia record -r"))
	hl.bind("SUPER + SHIFT + p", hl.dsp.exec_cmd("hyprpicker -a"), { locked = true })

	-- volume
	hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
	hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
	hl.bind(
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd(
			"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. vars.volumeStep .. "%+"
		),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd(
			"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. vars.volumeStep .. "%-"
		),
		{ locked = true, repeating = true }
	)

	hl.bind("SUPER + ALT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
	hl.bind("SUPER + CTRL + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
	hl.bind(
		"SUPER + bracketleft",
		hl.dsp.exec_cmd(
			"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. vars.volumeStep .. "%+"
		),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"SUPER + apostrophe",
		hl.dsp.exec_cmd(
			"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. vars.volumeStep .. "%-"
		),
		{ locked = true, repeating = true }
	)

	-- clipboard and emoji picker
	hl.bind("SUPER + comma", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"))
	hl.bind("SUPER + SHIFT + comma", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard -d"))
	hl.bind("SUPER + period", hl.dsp.exec_cmd("pkill fuzzel || caelestia emoji -p"))

	-- scripts
	hl.bind("SUPER + CTRL + bracketright", hl.dsp.exec_cmd(scriptDir .. "/toggle-touchpad"), { locked = true })
	hl.bind("SUPER + r", hl.dsp.exec_cmd(scriptDir .. "/folderfind"))
	hl.bind("SUPER + ALT + p", hl.dsp.exec_cmd(scriptDir .. "/passget"))
	hl.bind(
		"SUPER + CTRL + p",
		hl.dsp.exec_cmd("foot -a script -c " .. footConf .. " -e sh -c " .. scriptDir .. "/passgen")
	)

	-- changing from custom to caelestia keymap
	hl.bind(kbCustomBinds, hl.dsp.exec_cmd("caelestia shell toaster info KeyBinds 'Caelestia KeyBinds' Keyboard"))
	hl.bind(kbCustomBinds, hl.dsp.submap("reset"))
end)
