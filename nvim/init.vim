call plug#begin()

" Colorschemes
Plug 'Mofiqul/dracula.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'NLKNguyen/papercolor-theme'

" Common Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons

" Treesitter and org mode
Plug 'nvim-treesitter/nvim-treesitter'
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

" Tabout plugin
Plug 'abecodes/tabout.nvim'

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

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()


" ================================
" VIM Settings
" ================================
if has('win32') || has('win64')
	language en_US.utf8
endif

filetype plugin indent on
syntax enable
colorscheme dracula
set number relativenumber
set shellslash
set scrolloff=1
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

nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap yF :silent ! echo % \| pbcopy<CR>

nmap <C-Tab> :JABSOpen<CR>
nmap <leader><Tab> :JABSOpen<CR>
nmap <C-F> :HopChar2<CR>
nmap <leader>/ :HopChar2<CR>
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
  require 'todo-comments-conf'

	require 'jabs'.setup {}
	require 'hop'.setup {}
	require 'tabout'.setup {}
	require 'telescope'.setup {}
	require 'trouble'.setup {}
	require 'cmp'.setup {}

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
EOF

