return {
  {
    'tpope/vim-fugitive',
  },

  -- Enables GBrowse for GitHub files
  'tpope/vim-rhubarb',

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

