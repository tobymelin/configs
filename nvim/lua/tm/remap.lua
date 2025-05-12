local imap = require("tm.keymap").imap
local nmap = require("tm.keymap").nmap
local vmap = require("tm.keymap").vmap

local map = vim.keymap.set

nmap { "U", "<cmd>redo<CR>" }
nmap { "<BS>", "ciw" }

nmap { "<leader>b", function()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end
end }

-- window/buffer management shortcuts
-- nmap { "<leader>qw", "<cmd>bdel<CR>", { noremap = true } }
nmap { "<C-w>t", "<cmd>tabnew<CR>", { noremap = true } }
nmap { "<leader>qt", "<cmd>tabc<CR>", { noremap = true } }
nmap { "<leader>tp", "<cmd>tabp<CR>", { noremap = true } }
nmap { "<leader>tn", "<cmd>tabn<CR>", { noremap = true } }

nmap { "<leader>qf", "<cmd>copen<CR>", { noremap = true } }

nmap { "<leader>hl", "<cmd>nohlsearch<CR>" }
nmap { "<leader>w", "<cmd>w<CR>" }

-- now managed by smart-splits.nvim
-- nmap { "<C-h>", "<cmd>wincmd h<CR>" }
-- nmap { "<C-l>", "<cmd>wincmd l<CR>" }
-- nmap { "<C-j>", "<cmd>wincmd j<CR>" }
-- nmap { "<C-k>", "<cmd>wincmd k<CR>" }

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
-- nmap { "<leader>ff", "<cmd>Telescope find_files<CR>" }
-- nmap { "<leader>fg", "<cmd>Telescope live_grep<CR>" }
nmap { "<leader>ff", "<cmd>FzfLua files keymap.fzf.ctrl-q=select-all+accept actions.ctrl-q=false<CR>" }
nmap { "<leader>fg", "<cmd>FzfLua live_grep keymap.fzf.ctrl-q=select-all+accept actions.ctrl-q=false<CR>" }
nmap { "<leader>fh", "<cmd>Telescope help_tags<CR>" }
nmap { "<leader>fd", "<cmd>Telescope file_browser<CR>" }
nmap { "<leader>fr", "<cmd>Telescope resume<CR>" }
nmap { "<leader>fq", "<cmd>Telescope quickfix<CR>" }
-- nmap { "<leader>fc", "<cmd>Telescope colorscheme<CR>" }
nmap { "<leader>fc", function()
  require('telescope.builtin').colorscheme({ enable_preview = true })
end }
nmap({
  '<leader><Tab>',
  function()
    require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true, })
  end
})

nmap { "tr", "<cmd>Telescope lsp_references<CR>" }
nmap { "td", "<cmd>Telescope lsp_definitions<CR>" }
nmap { "tt", "<cmd>Telescope diagnostics<CR>" }

-- General plugin mappings
nmap { "<leader>?", "<cmd>Cheatsheet<CR>" }

-- LSP mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

nmap { '<leader>ft', function()
  vim.g.autoformat = not vim.g.autoformat
  vim.notify('Autoformat ' .. (vim.g.autoformat and 'enabled' or 'disabled'))
end, { desc = 'Toggle autoformat' } }

vim.keymap.set('n', '<leader>fe', function()
  -- vim.cmd('VtsExec add_missing_imports')
  -- vim.cmd('VtsExec remove_unused_imports')
  -- vim.cmd('TSToolsAddMissingImports')
  -- vim.cmd('TSToolsOrganizeImports')
  vim.cmd('EslintFixAll')
  -- vim.lsp.buf.format({ async = true })
  require('conform').format()
end, { desc = 'LSP: Lint and format' })

vim.keymap.set('n', '<leader>fx', function()
  -- vim.cmd('TSToolsAddMissingImports')
  -- vim.cmd('TSToolsRemoveUnusedImports')
  -- vim.cmd('TSToolsOrganizeImports')
  -- vim.cmd('VtsExec add_missing_imports')
  -- vim.cmd('VtsExec remove_unused_imports')
  vim.cmd('EslintFixAll')
  -- vim.lsp.buf.format({ async = true })
  require('conform').format()
end, { desc = 'TS: Fix imports' })
