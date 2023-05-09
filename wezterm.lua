-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Frappe'

config.font = wezterm.font('FiraCode Nerd Font Mono', { weight="Medium" })
-- config.line_height = 1.0

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  {
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal,
  },
  {
    key = "d",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical,
  },
  {
    key = "Enter",
    mods = "CMD|SHIFT",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = "[",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection 'Prev',
  },
  {
    key = "]",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection 'Next',
  },
}

-- and finally, return the configuration to wezterm
return config

