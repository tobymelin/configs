return {
  {
    'nvim-telescope/telescope.nvim',
    -- event = 'VeryLazy',
    branch = '0.1.x',
    dependencies = 'nvim-telescope/telescope-file-browser.nvim',
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            n = {
              ["K"] = require('telescope.actions').preview_scrolling_up,
              ["J"] = require('telescope.actions').preview_scrolling_down,
              ['H'] = require('telescope.actions').cycle_history_prev,
              ['L'] = require('telescope.actions').cycle_history_next,
              ['D'] = require('telescope.actions').delete_buffer,
            },
            i = {
              ["<C-B>"] = require('telescope.actions').preview_scrolling_up,
              ["<C-D>"] = require('telescope.actions').preview_scrolling_down,
            }
          }
        }
      })

      local themes = require('telescope.themes')

      local dropdown = themes.get_dropdown({
        hidden = true,
        no_ignore = false,
        previewer = false,
        prompt_title = '',
        preview_title = '',
        results_title = '',
        layout_config = { prompt_position = 'top' },
      })

        local with_title = function(opts, extra)
          extra = extra or {}
          local path = opts.cwd or opts.path or extra.cwd or extra.path or nil
          local title = ''
          local buf_path = vim.fn.expand('%:p:h')
          local cwd = vim.fn.getcwd()
          if path ~= nil and buf_path ~= cwd then
            title = require('plenary.path'):new(buf_path):make_relative(cwd)
          else
            title = vim.fn.fnamemodify(cwd, ':t')
          end

          return vim.tbl_extend('force', opts, {
            prompt_title = title
          }, extra or {})
        end

      vim.api.nvim_create_augroup('startup', { clear = true })
      vim.api.nvim_create_autocmd('VimEnter', {
        group = 'startup',
        pattern = '*',
        callback = function()
          -- Open file browser if argument is a folder
          local arg = vim.api.nvim_eval('argv(0)')
          if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
            vim.defer_fn(function()
              require('telescope.builtin').find_files(with_title(dropdown))
              -- require('telescope.builtin').find_files()
            end, 10)
          end
        end
      })
    end
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    event = 'VeryLazy',
    config = function()
      require("telescope").load_extension "file_browser"
    end
  },

  {
    'nvim-telescope/telescope-dap.nvim',
    event = 'VeryLazy',
    config = function()
      require('telescope').load_extension('dap')
    end
  }
}

