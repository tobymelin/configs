require("tm.remap")
require("tm.neovide")

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,130"

-- Hide mode information from command lines
vim.opt.showmode = false

-- Minimum line numbers to show above/below cursor
vim.opt.scrolloff = 8

-- Line numbering config
vim.opt.number = true
vim.opt.relativenumber = true

-- indentation configuration
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- show tab and space characters
vim.opt.list = true
vim.opt.listchars:append "space:⋅,eol:¬"

-- Case sensitive search if using uppercase characters, otherwise case
-- insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Various vim settings without Lua equivalents
vim.cmd([[
  filetype plugin indent on

  " tabline colour configuration
  hi TabLine      ctermfg=Black  ctermbg=8     cterm=NONE
  hi TabLineFill  ctermfg=Black  ctermbg=235     cterm=NONE
  hi TabLineSel   ctermfg=White  ctermbg=33  cterm=NONE

  " Required for org-mode
  set conceallevel=2
  set concealcursor=nc

  let g:vim_markdown_folding_disabled=1
  let g:vim_markdown_conceal = 0
]])

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Disable folding at startup.
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "1"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.json", "*.md" },
  command = "setlocal conceallevel=0",
})

-- null-ls helper
vim.g.autoformat = true
