call plug#begin()

" Colorschemes
Plug 'Mofiqul/dracula.nvim'
Plug 'navarasu/onedark.nvim'

" Common Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons

" Treesitter and org mode
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
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


lua require 'jabs'.setup {}
lua require 'hop'.setup {}
lua require 'tabout'.setup {}
lua require 'telescope'.setup {}
lua require 'gitsigns'.setup {}
lua require 'trouble'.setup {}
lua require 'cmp'.setup {}
lua require 'diffview'.setup {}
lua require 'neogit'.setup {}

lua << EOF
  require("todo-comments").setup {
    keywords = {
      TODOPRIO1 = { icon = "☐ ", color = "error" },
      TODOPRIO2 = { icon = "☐ ", color = "warning" },
      TODO = { icon = "☐ ", color = "info" },
      ACTV = { icon = "☐ ", color = "#f08080" },
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
    org_agenda_files = {[[~/org/*]], [[~/org/weekly/*]]},
    org_default_notes_file = '~/org/refile.org',
		org_blank_before_new_entry = { heading = false, plain_list_item = false },
		org_priority_highest = 1,
		org_priority_default = 3,
		org_priority_lowest = 5,
    org_todo_keywords = {'TODO(t)', 'WAIT', 'ACTV', '|', 'MVED', 'DONE'},
		org_capture_templates = {
			t = { description = 'Task', template = '* TODO %?\n %u' },
			n = { description = 'Note', template = '* %?\n %u' }
		}
})

require('lualine').setup({
	options = {
		theme = 'material',
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
	}
})
EOF

lua << EOF
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


" cmp settings
set completeopt=menu,menuone,noselect

lua <<EOF
	require'lspconfig'.tsserver.setup{}
	require'lspconfig'.eslint.setup{}

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap=true, silent=true, buffer=bufnr }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	end

	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap=true, silent=true }
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
		on_attach = on_attach,
    capabilities = capabilities
  }
EOF

