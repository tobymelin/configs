return {
  {
    'echasnovski/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.splitjoin').setup()
      require('mini.indentscope').setup()
      require('mini.bufremove').setup()
      require('mini.bracketed').setup()
      require('mini.git').setup()
    end,
    keys = {
      { '<leader>qw', '<cmd>lua require("mini.bufremove").delete()<cr>' },
    },
  },
}
