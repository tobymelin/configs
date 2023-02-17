vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

-- Minimum line numbers to show above/below cursor
vim.opt.scrolloff = 4

-- Line numbering config
vim.opt.number = true
vim.opt.relativenumber = true

-- indentation configuration
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- show tab and space characters
vim.opt.list = true

-- Case sensitive search if using uppercase characters, otherwise case
-- insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Various vim settings without Lua equivalents
vim.cmd [[
  filetype plugin indent on
  syntax enable
  " colorscheme gruvbox
  colorscheme nightfly

  " tabline colour configuration
  hi TabLine      ctermfg=Black  ctermbg=8     cterm=NONE
  hi TabLineFill  ctermfg=Black  ctermbg=235     cterm=NONE
  hi TabLineSel   ctermfg=White  ctermbg=33  cterm=NONE
]]