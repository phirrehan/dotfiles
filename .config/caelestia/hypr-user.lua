local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.config/caelestia/?.lua"

require("hypr.env")
require("hypr.input")
require("hypr.execs")
require("hypr.rules")
require("hypr.gestures")
require("hypr.keybinds")
