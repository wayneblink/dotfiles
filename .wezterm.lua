local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
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
