
return {
  {
    'nvim-orgmode/orgmode',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function ()
      -- Load custom tree-sitter grammar for org filetype
      require('orgmode').setup_ts_grammar()

      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.org = {
        install_info = {
          url = 'https://github.com/milisims/tree-sitter-org',
          revision = 'main',
          files = { 'src/parser.c', 'src/scanner.cc' },
        },
        filetype = 'org',
      }

      require('orgmode').setup({
        org_agenda_files = {[[~/org/*]], [[~/org/weekly/*]]},
        org_default_notes_file = '~/org/refile.org',
        org_blank_before_new_entry = { heading = false, plain_list_item = false },
        org_priority_highest = 1,
        org_priority_default = 4,
        org_priority_lowest = 5,
        org_todo_keywords = {'TODO(t)', 'WAIT', 'ACTV', '|', 'MVED', 'DONE'},
        org_capture_templates = {
          t = { description = 'Task', template = '* TODO %?\n %u' },
          n = { description = 'Note', template = '* %?\n %u' }
        }
      })

      vim.api.nvim_create_autocmd({ "BufRead,BufNewFile" }, {
        pattern = { "*.org" },
        command = "setlocal foldlevel=5",
        -- command = "setlocal conceallevel=2",
      })
    end
  },
}

