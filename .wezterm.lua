local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return {
			color_scheme = "Catppuccin Mocha",
			tab_bar = {
				background = "#181825",
				active_tab = {
					bg_color = "#cba6f7",
					fg_color = "#11111b",
				},
				inactive_tab = {
					bg_color = "#313244",
					fg_color = "#6c7086",
				},
				inactive_tab_hover = {
					bg_color = "#313244",
					fg_color = "#cdd6f4",
				},
				new_tab = {
					bg_color = "#181825",
					fg_color = "#6c7086",
				},
				new_tab_hover = {
					bg_color = "#cba6f7",
					fg_color = "#11111b",
				},
			},
		}
	else
		return {
			color_scheme = "Catppuccin Latte",
			tab_bar = {
				background = "#e6e9ef",
				active_tab = {
					bg_color = "#8839ef",
					fg_color = "#eff1f5",
				},
				inactive_tab = {
					bg_color = "#ccd0da",
					fg_color = "#9ca0b0",
				},
				inactive_tab_hover = {
					bg_color = "#ccd0da",
					fg_color = "#4c4f69",
				},
				new_tab = {
					bg_color = "#eff1f5",
					fg_color = "#9ca0b0",
				},
				new_tab_hover = {
					bg_color = "#8839ef",
					fg_color = "#eff1f5",
				},
			},
		}
	end
end

local scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.color_scheme = scheme.color_scheme
config.colors = { tab_bar = scheme.tab_bar }
config.set_environment_variables = {
	TERMINAL_THEME = scheme.color_scheme:find("Latte") and "light" or "dark",
}
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
