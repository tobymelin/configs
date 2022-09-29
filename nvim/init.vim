call plug#begin()

Plug 'Mofiqul/dracula.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'

" TODO comments/highlight
Plug 'nvim-lua/plenary.nvim'
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
" Case sensitive search if using uppercase characters, otherwise case
" insensitive
set ignorecase
set smartcase
set fileformats=unix,dos

" Required for org-mode
set conceallevel=2
set concealcursor=nc

" ================================
" Key mappings
" ================================
nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <C-Tab> :JABSOpen<CR>
nmap <leader><Tab> :JABSOpen<CR>
nmap <C-F> :HopChar2<CR>
nmap <leader>/ :HopChar2<CR>
nmap <leader>h :nohlsearch<CR>
map <C-S-V> "*p


lua require 'jabs'.setup {}
lua require 'hop'.setup {}
lua require 'tabout'.setup {}

lua << EOF
  require("todo-comments").setup {
    keywords = {
      TODOPRIO1 = { icon = "☐ ", color = "error" },
      TODOPRIO2 = { icon = "☐ ", color = "warning" },
      TODO = { icon = "☐ ", color = "info" },
      WAITING = { icon = "∞ ", color = "gray" },
      WAIT = { icon = "∞ ", color = "gray" },
      MOVED = { icon = "→ ", color = "#999999" },
      MVED = { icon = "→ ", color = "#999999" },
      DONE = {  icon = "✓ ", color = "green" },
    },
    colors = {
      gray = { "#cccccc" },
      green = { "#37c88b" },
    },
    highlight = {
      keyword = "bg",
      pattern = { [[.*<(KEYWORDS)\s*:]], [[\*\s<(KEYWORDS)\s]] }, -- pattern or table of patterns, used for highlightng (vim regex)  
      comments_only = false,
    }
  }
EOF


" CONFIG FOR ORG-MODE
lua << EOF
-- Load custom tree-sitter grammar for org filetype
    require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
      -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
        enable = true,
    --additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
      },
  --ensure_installed = {'org'}, -- Or run :TSUpdate org
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'org',
}

require('orgmode').setup({
    org_agenda_files = {[[~/Dropbox/org/*]]},
    org_default_notes_file = '~/Dropbox/org/refile.org',
    org_todo_keywords = {'TODO', 'WAIT', 'MVED', '|', 'DONE'},
})
EOF

