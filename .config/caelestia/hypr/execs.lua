hl.on("hyprland.start", function()
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hyprctl dispatch 'hl.dsp.submap(\"custom\")'")
end)
