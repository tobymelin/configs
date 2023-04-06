return {
  'stevearc/overseer.nvim',
  event = 'VeryLazy',
  config = function ()
    require('overseer').setup({
      templates = {
        "builtin",
        "user.ts_watch",
      },
    })
  end,
  keys = {
    { '<leader>oo', '<cmd>OverseerToggle<CR>' },
    { '<leader>or', '<cmd>OverseerRun<CR>' },
  },
}
