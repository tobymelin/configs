return {
  {
    'tpope/vim-fugitive',
  },

  -- 'TimUntersberger/neogit',

  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    config = function()
      require 'diffview'.setup({})
    end,
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>' },
    },
  },

}

