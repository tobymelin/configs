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

  -- Treesitter and org mode
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'nvim-orgmode/orgmode',

-- Type gS to split single line into a multi-liner
  'AndrewRadev/splitjoin.vim',

-- Buffer Switcher Window
  { 'matbme/JABS.nvim' },

-- Markdown plugin
  'ixru/nvim-markdown',

-- Hop (Navigation plugin)
  {
    'phaazon/hop.nvim',
    config = function()
      require 'hop'.setup {}
      nmap { "<leader>/", ":HopChar2<CR>" }
    end
  },

-- Multiline selection (Sublime-like)
  { 'mg979/vim-visual-multi', branch = 'master'},

-- Toggle line comments
  'terrortylor/nvim-comment',

-- Maximize window splits
  'declancm/maximize.nvim',

-- VimTeX
  'lervag/vimtex',

-- Vim Markdown plugin
  'godlygeek/tabular',
  'preservim/vim-markdown',

-- Harpoon (also requires plenary)
  'ThePrimeagen/harpoon',

-- Telescope File Tree
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },
  'nvim-telescope/telescope-file-browser.nvim',

-- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = {
        width = 40,
      }
    }
  },

-- Tabline plugin
  'mkitt/tabline.vim',

-- Center buffers
  'shortcuts/no-neck-pain.nvim',

  -- Git plugins
  -- 'TimUntersberger/neogit',
  'lewis6991/gitsigns.nvim',
  {
    'sindrets/diffview.nvim',
    config = function()
      require 'diffview'.setup({})
      nmap { "<leader>gd", "<cmd>DiffviewOpen<CR>" }
    end
  },

  'tpope/vim-fugitive',

  -- nvim completion
  'neovim/nvim-lspconfig',
  'folke/lsp-trouble.nvim',

  -- LSP plugin for Lua/Neovim configs
  'folke/neodev.nvim',

  -- LSP UI
  'glepnir/lspsaga.nvim',

  'jose-elias-alvarez/typescript.nvim',
  { 'fatih/vim-go', build = ':GoUpdateBinaries' },

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',

  'Issafalcon/lsp-overloads.nvim',

  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',

-- nvim debugging tools
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'mxsdev/nvim-dap-vscode-js',

-- nvim test runner
  'vim-test/vim-test',

-- Prettier (requires null-ls and lspconfig)
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
}

