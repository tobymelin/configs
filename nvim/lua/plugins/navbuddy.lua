-- navbuddy (outline view in popup window
local nmap = require("tm.keymap").nmap

return {
  {
    'SmiteshP/nvim-navbuddy',
    event = 'VeryLazy',
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    config = function ()
      require('nvim-navbuddy').setup({
        lsp = {
          auto_attach = true,
        },
      })

      nmap { '<leader>fo', '<cmd>lua require("nvim-navbuddy").open()<cr>' }
    end
  },
}
