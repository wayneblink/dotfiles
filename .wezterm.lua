local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Berkeley Mono")
config.color_scheme = "tokyonight_night"
config.enable_tab_bar = false
config.warn_about_missing_glyphs = false

config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
}

return config
