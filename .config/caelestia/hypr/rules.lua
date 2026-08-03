-- float
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, tag = "+float" })
hl.window_rule({ match = { class = "SFML" }, tag = "+float" })

-- tile
hl.window_rule({ match = { class = "discord" }, tag = "-float" })

-- special workspaces
hl.window_rule({ match = { class = "(WhatsApp Desktop)|(discord)" }, group = "set communication" })
hl.window_rule({ match = { class = "rmpc" }, workspace = "special:music" })
hl.window_rule({ match = { class = "WhatsApp Desktop" }, workspace = "special:communication" })
hl.window_rule({ match = { class = "Planify" }, workspace = "special:todo" })
hl.window_rule({ match = { class = "obsidian" }, workspace = "special:notes" })
hl.window_rule({ match = { class = "foot-fzf" }, tag = "+float", size = "1000 600", workspace = "special:special" })
