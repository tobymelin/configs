local imap = require("tm.keymap").imap
local nmap = require("tm.keymap").nmap
local vmap = require("tm.keymap").vmap

nmap { "U", "<cmd>redo<CR>" }

nmap { "<leader>b", function ()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end
end }

-- window/buffer management shortcuts
nmap { "<leader>qw", "<cmd>bdel<CR>", { noremap = true } }
nmap { "<leader>qt", "<cmd>tabc<CR>", { noremap = true } }

nmap { "<leader>h", "<cmd>nohlsearch<CR>" }
nmap { "<leader>w", "<cmd>w<CR>" }

-- Copy to clipboard
vmap { '<leader>y', '"+y', { noremap = true } }
nmap { '<leader>Y', '"+yg_', { noremap = true } }
nmap { '<leader>y', '"+y', { noremap = true } }
nmap { '<leader>yy', '"+yy', { noremap = true } }
nmap { 'yF', "<cmd>! echo % | pbcopy<CR>", { silent = true } }

-- Paste from clipboard
nmap { '<leader>p', '"+p', { noremap = true } }
nmap { '<leader>P', '"+P', { noremap = true } }
vmap { '<leader>p', '"+p', { noremap = true } }
vmap { '<leader>P', '"+P', { noremap = true } }
imap { '<C-S-V>', '"*p', { noremap = true } }

-- Telescope mappings
nmap { "<leader>ff", "<cmd>Telescope find_files<CR>" }
nmap { "<leader>fg", "<cmd>Telescope live_grep<CR>" }
nmap { "<leader>fb", "<cmd>Telescope buffers<CR>" }
nmap { "<leader>fh", "<cmd>Telescope help_tags<CR>" }
nmap { "<leader>fd", "<cmd>Telescope file_browser<CR>" }

nmap { "tr", "<cmd>Telescope lsp_references<CR>" }
nmap { "td", "<cmd>Telescope lsp_definitions<CR>" }
nmap { "tt", "<cmd>Telescope diagnostics<CR>" }

-- General plugin mappings
nmap { "<leader>?", "<cmd>Cheatsheet<CR>" }
nmap { "<leader>T", "<cmd>TroubleToggle<CR>" }

-- LSP mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

vim.keymap.set('n', '<leader>fx', function ()
  vim.cmd('EslintFixAll')
  vim.lsp.buf.format()
  vim.cmd('VtsExec add_missing_imports')
  vim.cmd('VtsExec remove_unused_imports')
end)

