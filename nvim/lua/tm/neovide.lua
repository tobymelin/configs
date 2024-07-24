vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

-- Gnome term colours
vim.g.terminal_color_0  = '#2e3436'
vim.g.terminal_color_1  = '#cc0000'
vim.g.terminal_color_2  = '#4e9a06'
vim.g.terminal_color_3  = '#c4a000'
vim.g.terminal_color_4  = '#3465a4'
vim.g.terminal_color_5  = '#75507b'
vim.g.terminal_color_6  = '#0b939b'
vim.g.terminal_color_7  = '#d3d7cf'
vim.g.terminal_color_8  = '#555753'
vim.g.terminal_color_9  = '#ef2929'
vim.g.terminal_color_10 = '#8ae234'
vim.g.terminal_color_11 = '#fce94f'
vim.g.terminal_color_12 = '#729fcf'
vim.g.terminal_color_13 = '#ad7fa8'
vim.g.terminal_color_14 = '#00f5e9'
vim.g.terminal_color_15 = '#eeeeec'

-- tm-colors
vim.g.terminal_color_0  = '#2e3436'
vim.g.terminal_color_1  = '#cc0000'
vim.g.terminal_color_2  = '#4e9a06'
vim.g.terminal_color_3  = '#c4a000'
vim.g.terminal_color_4  = '#3465a4'
vim.g.terminal_color_5  = '#75507b'
vim.g.terminal_color_6  = '#0b939b'
vim.g.terminal_color_7  = '#d3d7cf'
vim.g.terminal_color_8  = '#555753'
vim.g.terminal_color_9  = '#ef2929'
vim.g.terminal_color_10 = '#8ae234'
vim.g.terminal_color_11 = '#fce94f'
vim.g.terminal_color_12 = '#729fcf'
vim.g.terminal_color_13 = '#ad7fa8'
vim.g.terminal_color_14 = '#00f5e9'
vim.g.terminal_color_15 = '#eeeeec'
