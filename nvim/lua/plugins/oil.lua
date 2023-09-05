return {
  'stevearc/oil.nvim',
  opts = {
    float = {
      padding = 5,
      -- win_options = {
      --   winblend = 20,
      -- },
    },
    keymaps = {
      ["q"] = "actions.close",
    },
  },
  keys = {
    -- { '<leader>to', '<cmd>Oil<CR>' },
    { '<leader>to', '<cmd>Oil --float<CR>' },
  },
}
