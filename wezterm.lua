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
config.color_scheme = 'Github'
config.color_scheme = 'Nord Light (Gogh)'
config.color_scheme = 'Catppuccin Latte'
config.color_scheme = 'Catppuccin Macchiato'

-- config.font = wezterm.font('FiraCode Nerd Font Mono', { weight="Medium" })
config.font = wezterm.font('JetBrainsMono Nerd Font Mono', { weight="Medium" })
-- config.line_height = 1.0

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.colors = {
  visual_bell = "#1e2030",
  tab_bar = {
    background = "#2E3440",
    active_tab = {
      bg_color = "#4C566A",
      fg_color = "#ECEFF4",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#3B4252",
      fg_color = "#ECEFF4",
      intensity = "Normal",
    },
    inactive_tab_hover = {
      bg_color = "#434C5E",
      fg_color = "#ECEFF4",
    },
    new_tab = {
      bg_color = "#3B4252",
      fg_color = "#ECEFF4",
    },
    new_tab_hover = {
      bg_color = "#434C5E",
      fg_color = "#ECEFF4",
    },
  },
}

-- config.leader = { key="b", mods="CTRL" }
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
  {
    key = 'H',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'J',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'K',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 }
  },
  {
    key = 'L',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
}

-- and finally, return the configuration to wezterm
return config

