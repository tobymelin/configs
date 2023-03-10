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


vim.cmd[[
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hi :lua require("harpoon.mark").add_file()<CR>

" vim-test mappings
nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>

nnoremap <C-t> :NvimTreeFindFile<CR>

nmap <C-Tab> :JABSOpen<CR>
nmap <leader><Tab> :JABSOpen<CR>
nmap <leader>? :Cheatsheet<CR>
nmap <leader>tt :NvimTreeToggle<CR>
nmap <leader>T :TroubleToggle<CR>
nmap <leader>C :NoNeckPain<CR>
]]
