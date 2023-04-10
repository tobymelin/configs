local nmap = require("tm.keymap").nmap

return {
  -- Common Dependencies
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons', -- optional, for file icons

  -- Utilities
  'sudormrfbin/cheatsheet.nvim',

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
      })
    end
  },

  -- Type gS to split single line into a multi-liner
  'AndrewRadev/splitjoin.vim',

  -- nvim-surround, use ys{motion}{char}, ds{char} and cs{target}{replacement} to change surround characters
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function ()
      require('nvim-surround').setup()
    end
  },

-- Buffer Switcher Window
  { 'matbme/JABS.nvim' },

-- Markdown plugin
  'ixru/nvim-markdown',

-- Hop (Navigation plugin)
  {
    'phaazon/hop.nvim',
    config = function()
      require 'hop'.setup {}
      nmap { "<leader>/", "<cmd>HopChar2<CR>" }
    end
  },

-- Multiline selection (Sublime-like)
  { 'mg979/vim-visual-multi', branch = 'master'},

-- Toggle line comments
  {
    'terrortylor/nvim-comment',
    config = function ()
      require('nvim_comment').setup()
    end
  },

-- Maximize window splits
  {
    'declancm/maximize.nvim',
    config = function ()
      require('maximize').setup()

      vim.keymap.set('n', '<leader>z', "<cmd>lua require('maximize').toggle()<CR>")
    end
  },

-- VimTeX
  'lervag/vimtex',

-- Vim Markdown plugin
  'godlygeek/tabular',
  'preservim/vim-markdown',

-- Harpoon (also requires plenary)
  'ThePrimeagen/harpoon',

-- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    event = 'VeryLazy',
    opts = {
      view = {
        width = 40,
      }
    }
  },

-- Tabline plugin
  'mkitt/tabline.vim',

-- Center buffers
  {
    'shortcuts/no-neck-pain.nvim',
    lazy = true,
    keys = {
     { '<leader>C', '<cmd>NoNeckPain<CR>' },
    },
  },

  -- Git plugins
  -- 'TimUntersberger/neogit',
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    config = function()
      require 'diffview'.setup({})
    end,
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>' },
    },
  },

  'tpope/vim-fugitive',

  -- nvim completion
  'neovim/nvim-lspconfig',
  'folke/lsp-trouble.nvim',

  -- LSP plugin for Lua/Neovim configs
  'folke/neodev.nvim',

  'jose-elias-alvarez/typescript.nvim',
  { 'fatih/vim-go', build = ':GoUpdateBinaries' },
  -- 'ray-x/go.nvim',

  -- Show code signature overloads in lsp
  -- 'Issafalcon/lsp-overloads.nvim',

  -- GitHub Copilot
  {
    'github/copilot.vim',
    event = 'VeryLazy',
  },

  -- Code completion/signature help while typing
  'ray-x/lsp_signature.nvim',

  -- nvim test runner
  {
    'vim-test/vim-test',
    config = function ()
      vim.cmd([[ tmap <C-o> <C-\><C-n> ]])
    end
  },

-- Prettier (requires null-ls and lspconfig)
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
}

