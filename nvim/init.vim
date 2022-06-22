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

call plug#end()

syntax on
colorscheme dracula
set number relativenumber
set shellslash
set scrolloff=1

" Required for org-mode
set conceallevel=2
set concealcursor=nc

nmap <C-Tab> :JABSOpen<CR>


lua require 'jabs'.setup {}

lua << EOF
  require("todo-comments").setup {
    keywords = {
      TODOPRIO1 = { icon = "☐ ", color = "error" },
      TODOPRIO2 = { icon = "☐ ", color = "warning" },
      TODO = { icon = "☐ ", color = "info" },
      WAITING = { color = "gray" },
      MOVED = { icon = "→ ", color = "info" },
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
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
      },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
      org_agenda_files = {[[~/Dropbox/org/*]]},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
EOF
