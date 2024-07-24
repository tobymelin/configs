return {
  'mfussenegger/nvim-dap',

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    event = 'VeryLazy',
    config = function()
      local dap = require("dap")
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()

      vim.keymap.set('n', '<leader>dd', require('dapui').toggle, { desc = 'Toggle DAP UI' })
      vim.keymap.set('n', '<leader>dc', dap.continue)
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>di', dap.step_into)
      vim.keymap.set('n', '<leader>do', dap.step_over)
      vim.keymap.set('n', '<leader>dt', dap.terminate)
      vim.keymap.set('n', '<leader>drr', dap.clear_breakpoints)
      vim.keymap.set('n', '<leader>dro', dap.repl.toggle)
      vim.keymap.set('n', '<leader>duf',
        "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

      vim.keymap.set('n', '<F1>', dap.continue)
      vim.keymap.set('n', '<F2>', dap.step_into)
      vim.keymap.set('n', '<F3>', dap.step_over)
      vim.keymap.set('n', '<F4>', dap.terminate)

      vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#ed3d3d', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

      -- Potential characters: ●, •, ◌, ◎, ○, ◦, ⚫, ⬤, ⚫, 🌑, 🟦, 🟥, 🟪, 🟨, 🟩, 🟧, 🟦, 🟫, 🟪
      local sign = '🟥'
      vim.fn.sign_define('DapBreakpoint', {
        text = sign,
        texthl = 'red',
        linehl = 'DapBreakpoint',
        numhl =
        'DapBreakpoint'
      })
      vim.fn.sign_define('DapBreakpointCondition',
        { text = sign, texthl = 'blue', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected',
        { text = '•', texthl = 'orange', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapStopped',
        { text = '•', texthl = 'green', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', {
        text = '•',
        texthl = 'yellow',
        linehl = 'DapBreakpoint',
        numhl =
        'DapBreakpoint'
      })
    end
  },
}
