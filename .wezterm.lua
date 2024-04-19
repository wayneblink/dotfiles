local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.font = wezterm.font('Berkeley Mono')

config.keys = {
  { key = 'Enter', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
}

return config
