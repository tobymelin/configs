return {
  {
    'echasnovski/mini.nvim',
    version = false,
    lazy = false,
    config = function()
      require('mini.splitjoin').setup()
      require('mini.indentscope').setup()
      require('mini.bufremove').setup()
      require('mini.bracketed').setup()
    end,
    keys = {
      { '<leader>qw', '<cmd>lua require("mini.bufremove").delete()<cr>' },
    },
  },
}

