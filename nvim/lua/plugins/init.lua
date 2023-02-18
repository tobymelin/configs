return {
  -- Common Dependencies
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons', -- optional, for file icons

  -- Utilities
  'sudormrfbin/cheatsheet.nvim',
  'lukas-reineke/indent-blankline.nvim',

  -- Treesitter and org mode
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'nvim-orgmode/orgmode',

-- TODO comments/highlight
  'folke/todo-comments.nvim',

-- Type gS to split single line into a multi-liner
  'AndrewRadev/splitjoin.vim',

-- Buffer Switcher Window
  { 'matbme/JABS.nvim' },

-- Markdown plugin
  'ixru/nvim-markdown',

-- Hop (Navigation  in)
  'phaazon/hop.nvim',

-- Multiline selection (Sublime-like)
  { 'mg979/vim-visual-multi', branch = 'master'},

-- Tabout plugin
  'abecodes/tabout.nvim',

-- Toggle line comments
  'terrortylor/nvim-comment',

-- Toggleterm
  { 'akinsho/toggleterm.nvim', lazy = false },

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
  'nvim-tree/nvim-tree.lua',

-- Status Line and tabline
  'nvim-lualine/lualine.nvim',
  'mkitt/tabline.vim',

-- Center buffers
  'shortcuts/no-neck-pain.nvim',

  -- Git plugins
  -- 'TimUntersberger/neogit',
  'lewis6991/gitsigns.nvim',
  'sindrets/diffview.nvim',
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

