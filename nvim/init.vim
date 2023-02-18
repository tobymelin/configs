call plug#begin()

" Colorschemes
" Plug 'Mofiqul/dracula.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'Everblush/nvim'
Plug 'navarasu/onedark.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'tanvirtin/monokai.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Common Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons

" Utilities
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" Treesitter and org mode
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-orgmode/orgmode'

" TODO comments/highlight
Plug 'folke/todo-comments.nvim'

" Type gS to split single line into a multi-liner
Plug 'AndrewRadev/splitjoin.vim'

" Buffer Switcher Window
Plug 'matbme/JABS.nvim'

" Markdown plugin
Plug 'ixru/nvim-markdown'

" Hop (Navigation Plugin)
Plug 'phaazon/hop.nvim'

" Multiline selection (Sublime-like)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Tabout plugin
Plug 'abecodes/tabout.nvim'

" Toggle line comments
Plug 'terrortylor/nvim-comment'

" Toggleterm
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" Maximize window splits
Plug 'declancm/maximize.nvim'

" VimTeX
Plug 'lervag/vimtex'

" Vim Markdown plugin
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" Harpoon (also requires plenary)
Plug 'ThePrimeagen/harpoon'

" Telescope File Tree
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" nvim-tree
Plug 'nvim-tree/nvim-tree.lua'

" Status Line and tabline
Plug 'nvim-lualine/lualine.nvim'
Plug 'mkitt/tabline.vim'

" Center buffers
Plug 'shortcuts/no-neck-pain.nvim'

" Git plugins
"Plug 'TimUntersberger/neogit'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-fugitive'

" nvim completion
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-trouble.nvim'

" LSP plugin for Lua/Neovim configs
Plug 'folke/neodev.nvim'

" LSP UI
Plug 'glepnir/lspsaga.nvim'

Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'Issafalcon/lsp-overloads.nvim'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" nvim debugging tools
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'

" nvim test runner
Plug 'vim-test/vim-test'

" Prettier (requires null-ls and lspconfig)
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

call plug#end()

lua require("tm")


lua << EOF
require 'git'
require 'orgmode-conf'
require 'lsp-and-cmp'
require 'dap-conf'
require 'term'
require 'todo-comments-conf'

require 'telescope'.setup {
  defaults = {
    mappings = {
      n = {
        ["K"] = require('telescope.actions').preview_scrolling_up,
        ["J"] = require('telescope.actions').preview_scrolling_down,
      },
      i = {
        ["<C-B>"] = require('telescope.actions').preview_scrolling_up,
        ["<C-D>"] = require('telescope.actions').preview_scrolling_down,
      }
    }
  }
}
require("telescope").load_extension "file_browser"

require('lualine').setup({
  options = {
    theme = 'material',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  }
})

require("nvim-tree").setup({
  view = {
    width = 40,
  }
})

require 'tabout'.setup {
  tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
  backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
  act_as_tab = true, -- shift content if tab out is not possible
  act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
  default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  default_shift_tab = '<C-d>', -- reverse shift default action,
  enable_backwards = true, -- well ...
  completion = true, -- if the tabkey is used in a completion pum
  tabouts = {
    {open = "'", close = "'"},
    {open = '"', close = '"'},
    {open = '`', close = '`'},
    {open = '(', close = ')'},
    {open = '[', close = ']'},
    {open = '{', close = '}'}
  },
  ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  exclude = {} -- tabout will ignore these filetypes
}

vim.api.nvim_set_keymap('i', '<A-x>', "<Plug>(TaboutMulti)", {silent = true})
vim.api.nvim_set_keymap('i', '<A-z>', "<Plug>(TaboutBackMulti)", {silent = true})

require("indent_blankline").setup {
  space_char_blankline = " ",
}
EOF

