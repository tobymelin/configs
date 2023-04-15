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
      vim.keymap.set('n', '<space>dc', '<cmd>lua require("dap").clear_breakpoints()<CR>')
      vim.keymap.set('n', '<space>dro', '<cmd>lua require("dap").repl.open()<CR>')
      vim.keymap.set('n', '<leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

      vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#ed3d3d', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

      -- Potential characters: ●, •, ◌, ◎, ○, ◦, ⚫, ⬤, ⚫, 🌑, 🟦, 🟥, 🟪, 🟨, 🟩, 🟧, 🟦, 🟫, 🟪
      local sign = '🟥'
      vim.fn.sign_define('DapBreakpoint',          { text=sign, texthl='red',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text=sign, texthl='blue',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected',  { text='•', texthl='orange', linehl='DapBreakpoint', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapStopped',             { text='•', texthl='green',  linehl='DapBreakpoint', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint',            { text='•', texthl='yellow', linehl='DapBreakpoint', numhl='DapBreakpoint' })
    end
  },
}
