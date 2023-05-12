local default_colorscheme = 'nordic'
local M = {}

M = {
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    -- priority = 1000,
    -- lazy = false,
    -- config = function()
      -- vim.cmd.colorscheme('nightfly')
    -- end,
  },
  --  'Mofiqul/dracula.nvim',
  -- { 'dracula/vim', name = 'dracula' },
  -- 'Everblush/nvim',
  -- 'navarasu/onedark.nvim',
  -- 'EdenEast/nightfox.nvim',
  {
    'NLKNguyen/papercolor-theme',
    name = 'Papercolor',
  },
  -- 'morhetz/gruvbox',
  -- 'tanvirtin/monokai.nvim',
  { 'sainnhe/sonokai' },
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
            fg = palette.grey5,
            italic = false,
          },
          Search = {
            bg = palette.grey4,
          },
    }
      })
    end
  },
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
  },
  {
    'marko-cerovac/material.nvim',
    name = 'material',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        flavour = 'macchiato',
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
    'NTBBloodbath/sweetie.nvim',
    name = 'sweetie',
  },
  {
    'maxmx03/dracula.nvim',
    name = 'dracula',
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
