require 'toggleterm'.setup {
  open_mapping = [[<c-\>]],
  direction = "float",
  float_opts = {
    border = "double",
  },
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>L", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

