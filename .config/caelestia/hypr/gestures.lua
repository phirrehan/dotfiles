local vars = require("variables")
-- unset
hl.gesture({ fingers = vars.gestureFingers, direction = "up", action = "unset", workspace_name = "special" })
hl.gesture({
	fingers = vars.gestureFingersMore,
	direction = "down",
	action = "unset",
})

-- override gestures
hl.gesture({
	fingers = vars.gestureFingersMore,
	direction = "down",
	action = function()
		hl.exec_cmd("foot")
	end,
})
hl.gesture({
	fingers = vars.gestureFingersMore,
	direction = "up",
	action = function()
		hl.exec_cmd(vars.sleepGestureCmd)
	end,
})
