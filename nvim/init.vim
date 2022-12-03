call plug#begin()

" Colorschemes
Plug 'Mofiqul/dracula.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

" Common Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons

" Utilities
Plug 'sudormrfbin/cheatsheet.nvim'

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

" VimTeX
Plug 'lervag/vimtex'

" Vim Markdown plugin
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" Telescope File Tree
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" NERDTree
Plug 'preservim/nerdtree'

" Status Line
Plug 'nvim-lualine/lualine.nvim'

" Git plugins
Plug 'TimUntersberger/neogit'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-fugitive'

" vim-tree
Plug 'nvim-tree/nvim-tree.lua'

" nvim completion
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-trouble.nvim'

Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" nvim debugging tools
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'

call plug#end()


" ================================
" VIM Settings
" ================================
if has('win32') || has('win64')
	language en_US.utf8
endif

filetype plugin indent on
syntax enable
colorscheme gruvbox
set number relativenumber
set shellslash
set scrolloff=1
set list " show tab and space characters

" Set tab width and auto-expand tab characters
set tabstop=2
set shiftwidth=2
set expandtab

" Case sensitive search if using uppercase characters, otherwise case
" insensitive
set ignorecase
set smartcase
set fileformats=unix,dos

" Required for org-mode
set conceallevel=2
set concealcursor=nc

let g:vim_markdown_folding_disabled=1

" ================================
" Key mappings
" ================================
nnoremap <SPACE> <Nop>
let mapleader=" "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>qw <cmd>bdel<CR>
nnoremap <leader>qt <cmd>tabc<CR>

nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap yF :silent ! echo % \| pbcopy<CR>

nmap <C-Tab> :JABSOpen<CR>
nmap <leader><Tab> :JABSOpen<CR>
nmap <leader>/ :HopChar2<CR>
nmap <leader>? :Cheatsheet<CR>
nmap <leader>G :Neogit<CR>
nmap <leader>gd :DiffviewOpen<CR>
nmap <leader>h :nohlsearch<CR>
nmap <leader>w :w<CR>
nmap <leader>t :NvimTreeToggle<CR>
nmap <leader>T :TroubleToggle<CR>
map <C-S-V> "*p

lua << EOF
  require 'git'
  require 'orgmode-conf'
  require 'lsp-and-cmp'
  require 'dap-conf'
  require 'todo-comments-conf'

  require 'jabs'.setup {}
  require 'hop'.setup {}
  require 'telescope'.setup {}
  require 'trouble'.setup {}
  require 'cmp'.setup {}
  require 'nvim_comment'.setup {}
  require 'cheatsheet'.setup {}

  require 'toggleterm'.setup {
    open_mapping = [[<c-\>]]
  }

  require('lualine').setup({
    options = {
      theme = 'material',
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
    }
  })

  require("nvim-tree").setup({
    view = {
      mappings = {
        list = {
          { key = "u", action = "dir_up" }
        }
      }
    },
    filters = {
      dotfiles = true
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
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
EOF

