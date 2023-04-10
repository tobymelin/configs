return {
  'mfussenegger/nvim-dap',

  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    config = function ()
      require("dapui").setup()

      vim.keymap.set('n', '<space>dd', require('dapui').toggle)
      vim.keymap.set('n', '<space>dc', '<cmd>DapContinue<CR>')
      vim.keymap.set('n', '<space>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
      vim.keymap.set('n', '<space>dro', '<cmd>lua require("dap").repl.open()<CR>')
      vim.keymap.set('n', '<leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
    end
  },
}
