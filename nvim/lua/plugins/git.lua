return {
  {
    'tpope/vim-fugitive',
    config = function ()
      vim.api.nvim_create_user_command(
        'Browse',
        function (opts)
          vim.fn.system { 'open', '-a', 'Firefox', opts.fargs[1] }
        end,
        { nargs = 1 }
      )
    end
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

