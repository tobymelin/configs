return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = 'nvim-telescope/telescope-file-browser.nvim',
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            n = {
              ["K"] = require('telescope.actions').preview_scrolling_up,
              ["J"] = require('telescope.actions').preview_scrolling_down,
            },
            i = {
              ["<C-B>"] = require('telescope.actions').preview_scrolling_up,
              ["<C-D>"] = require('telescope.actions').preview_scrolling_down,
            }
          }
        }
      })
    end
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    config = function()
      require("telescope").load_extension "file_browser"
    end
  },
}

