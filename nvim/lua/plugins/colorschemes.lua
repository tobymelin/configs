local default_colorscheme = 'everforest'
-- local default_colorscheme = 'catppuccin'
-- local default_colorscheme = 'kanagawa'
-- local default_colorscheme = 'nordic'
-- local default_colorscheme = 'rose-pine'
-- local default_colorscheme = 'bamboo'
local M = {}

M = {
  -- { 'sainnhe/sonokai' },
  {
    'sainnhe/everforest',
    name = 'everforest',
    config = function ()
      vim.g.everforest_background = 'hard'
    end
  },
  {
    'sainnhe/gruvbox-material',
    config = function ()
      vim.g.gruvbox_material_background = 'hard'
    end
  },
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    -- priority = 1000,
    -- lazy = false,
    -- config = function()
      -- vim.cmd.colorscheme('nightfly')
    -- end,
  },
  { -- nice light theme
    'sainnhe/edge',
  },
  {
    'scottmckendry/cyberdream.nvim',
  },
  {
    'fynnfluegge/monet.nvim',
  },
  {
    'dgox16/oldworld.nvim',
  },
  {
    'mellow-theme/mellow.nvim',
  },
  { 'dasupradyumna/midnight.nvim' },
  {
    'ribru17/bamboo.nvim',
    name = 'bamboo',
    config = function ()
      require('bamboo').setup({
        highlights = {
          MiniIndentscopeSymbol = { fg = '#90acff' },
          IblIndent = { fg = '#999999' },
        },
      })
    end,
  },
  {
    'HoNamDuong/hybrid.nvim',
    name = 'hybrid',
  },
  {
    'rmehri01/onenord.nvim',
    name = 'onenord',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function ()
      require('rose-pine').setup({
        dark_variant = 'moon',
        highlight_groups = {
          MiniIndentscopeSymbol = { fg = '#90acff' },
        },
      })
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    name = 'dracula',
  },
  -- {
  --   'maxmx03/dracula.nvim',
  --   name = 'dracula',
  -- },
  -- { 'dracula/vim', name = 'dracula' },
  -- 'navarasu/onedark.nvim',
  -- 'morhetz/gruvbox',
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
  },
  { 'projekt0n/github-nvim-theme' },
  {
    'AlexvZyl/nordic.nvim',
    name = 'nordic',
    opts = {
    },
    config = function ()
      local palette = require 'nordic.colors'

      require('nordic').setup({
        override = {
          Comment = {
            fg = palette.gray5,
            italic = false,
          },
          Search = {
            bg = palette.gray5,
          },
          Visual = {
            bg = palette.gray5,
          },
        },
      })
    end
  },
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    config = function ()
      require('kanagawa').setup({
        overrides = function ()
          return {
            MiniIndentscopeSymbol = { fg = '#90acff' },
          }
        end,
      })
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        custom_highlights = function (colors)
          return {
            FlashCurrent = { bg = '#800000' },
            FlashMatch = { bg = '#555555' },
          }
        end,
        -- flavour = 'latte',
        -- custom_highlights = function (colors)
          -- return {
            -- Comment = { fg = colors.flamingo, bg = "#0f0aff" },
            -- Cursor = { fg = "#ffffff", bg = "#ffffff" },
            -- CursorColumn = { fg = "#ffffff", bg = "#ffffff" },
            -- iCursor = { fg = "#ffffff", bg = "#ffffff" },
          -- }
        -- end
      })
    end,
  },
  {
    'shaunsingh/nord.nvim',
    name = 'nord',
  },
  { -- nice light theme
    'ramojus/mellifluous.nvim',
    name = 'mellifluous',
  },
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    branch = 'main',
    config = function()
      require('tokyonight').setup({
        on_highlights = function(hl, c)
          hl.TelescopePreviewMatch = { bg = c.bg_search, fg = c.orange }
          hl.TelescopeResults = { bg = c.bg_search, fg = c.fg }
          hl.TelescopeSelection = { bg = c.bg_search, fg = c.fg }
          hl.TelescopeMatching = { fg = c.orange }
        end
      })
    end
  },
}

for key, val in ipairs(M) do
  -- vim.print(val)
    if val.name == default_colorscheme then
      M[key].priority = 1000
      M[key].lazy = false

      if val.config == nil then
        M[key].config = function()
          vim.cmd.colorscheme(default_colorscheme)
        end
      else
        local config = val.config
        M[key].config = function()
          config()
          vim.cmd.colorscheme(default_colorscheme)
        end
      end

    else
      M[key].event = 'VeryLazy'
    end
end

return M
