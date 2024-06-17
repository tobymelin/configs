-- Pull in the wezterm API
local w = require('wezterm')
local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- For example, changing the color scheme:
config.color_scheme = 'Github'
config.color_scheme = 'Nord Light (Gogh)'
config.color_scheme = 'Catppuccin Latte'
config.color_scheme = 'Catppuccin Macchiato'
config.color_scheme = 'Rosé Pine Moon (Gogh)'
config.color_scheme = 'Everforest Dark (Gogh)'

-- config.font = wezterm.font('FiraCode Nerd Font Mono', { weight="Medium" })
-- config.font = wezterm.font('JetBrainsMono Nerd Font Mono', { weight="Medium" })
config.font = wezterm.font('Hack Nerd Font')
config.font = wezterm.font('MonoLisa Nerd Font')
config.font = wezterm.font('MonoLisa')
-- config.font = wezterm.font('Berkeley Mono', { weight="Medium" })
-- config.font = wezterm.font('SauceCodePro Nerd Font', { weight="Medium" })
-- config.font = wezterm.font('Input Mono')
-- config.font = wezterm.font('IosevkaTerm Nerd Font', { weight="Medium" })
-- config.font = wezterm.font('CommitMono')
-- config.font = wezterm.font('Operator Mono', { weight="Light" })
-- config.line_height = 1.00

config.font = wezterm.font_with_fallback{
  -- 'Victor Mono',
  -- 'JetBrainsMono Nerd Font',
  'MonoLisa',
  'Berkeley Mono',
  'Iosevka Comfy', 'Iosevka Nerd Font',
  'Symbols Nerd Font Mono',
  'JetBrains Mono'
}
-- config.font = wezterm.font_with_fallback{'MonoLisa', 'Symbols Nerd Font Mono', 'JetBrains Mono'}

-- Disable font hinting to improve display on HiDPI screens
config.freetype_load_flags = 'NO_HINTING'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.max_fps = 144

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

-- -------------- smart-splits.nvim config start
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  Left = 'h',
  Down = 'j',
  Up = 'k',
  Right = 'l',
  -- reverse lookup
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'SHIFT|META' or 'CTRL',
    action = w.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'SHIFT|CTRL' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end
-- -------------- smart-splits.nvim config end

-- config.leader = { key="b", mods="CTRL" }
config.keys = {
  -- move between split panes
  split_nav('move', 'h'),
  split_nav('move', 'j'),
  split_nav('move', 'k'),
  split_nav('move', 'l'),
  -- resize panes
  split_nav('resize', 'h'),
  split_nav('resize', 'j'),
  split_nav('resize', 'k'),
  split_nav('resize', 'l'),
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
  -- {
  --   key = 'H',
  --   mods = 'LEADER',
  --   action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  -- },
  -- {
  --   key = 'J',
  --   mods = 'LEADER',
  --   action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  -- },
  -- {
  --   key = 'K',
  --   mods = 'LEADER',
  --   action = wezterm.action.AdjustPaneSize { 'Up', 5 }
  -- },
  -- {
  --   key = 'L',
  --   mods = 'LEADER',
  --   action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  -- },
  {
    key = 'E',
    mods = 'CMD|SHIFT',
    action = wezterm.action.QuickSelectArgs {
      label = 'open url',
      patterns = {
        'https?://\\S+',
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info('opening: ' .. url)
        wezterm.open_with(url)
      end),
    },
  },
}

-- and finally, return the configuration to wezterm
return config

