return {
  'stevearc/overseer.nvim',
  event = 'VeryLazy',
  config = function ()
    require('overseer').setup({
      component_aliases = {
        default_no_dispose = {
          { "display_duration", detail_level = 2 },
          "on_output_summarize",
          "on_exit_set_status",
          "on_complete_notify",
        },
      },
      templates = {
        "builtin",
        "user.ts_watch",
        "user.tsbuild_watch",
      },
    })
  end,
  keys = {
    { '<leader>oo', '<cmd>OverseerToggle<CR>' },
    { '<leader>or', '<cmd>OverseerRun<CR>' },
  },
}
