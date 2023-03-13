return {
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
  'NLKNguyen/papercolor-theme',
  -- 'morhetz/gruvbox',
  -- 'tanvirtin/monokai.nvim',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function()
      require('catppuccin').setup({
        flavour = 'macchiato',
        custom_highlights = function (colors)
          return {
            -- Comment = { fg = colors.flamingo, bg = "#0f0aff" },
            -- Cursor = { fg = "#ffffff", bg = "#ffffff" },
            -- CursorColumn = { fg = "#ffffff", bg = "#ffffff" },
            -- iCursor = { fg = "#ffffff", bg = "#ffffff" },
          }
        end
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
  { 'NTBBloodbath/sweetie.nvim' },
  {
    'folke/tokyonight.nvim',
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

