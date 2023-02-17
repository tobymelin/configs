local imap = require("tm.keymap").imap
local nmap = require("tm.keymap").nmap
local vmap = require("tm.keymap").vmap

vim.g.mapleader = " "

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

