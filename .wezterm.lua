local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = "tokyonight_night"
config.warn_about_missing_glyphs = false
config.enable_scroll_bar = true
config.window_decorations = "RESIZE"

config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
}

if wezterm.target_triple:find('windows') then
  config.default_domain = 'WSL:NixOS'
end

return config
