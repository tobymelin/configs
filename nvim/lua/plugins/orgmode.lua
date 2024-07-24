return {
  {
    'nvim-orgmode/orgmode',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    ft = 'org',
    config = function()
      require('orgmode').setup({
        -- org_agenda_files = { [[~/org/*]], [[~/org/weekly/*]], [[~/org/monthly/*]] },
        org_agenda_files = { [[~/org/*]], [[~/org/monthly/*]] },
        org_default_notes_file = '~/org/refile.org',
        org_blank_before_new_entry = { heading = false, plain_list_item = false },
        org_priority_highest = 1,
        org_priority_default = 3,
        org_priority_lowest = 5,
        org_todo_keywords = { 'TODO(t)', 'WAIT', 'ACTV', '|', 'MVED', 'DONE' },
        org_capture_templates = {
          t = { description = 'Task', template = '* TODO %?\n  %u' },
          n = { description = 'Note', template = '* %?\n %u' }
        }
      })

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.org" },
        command = "setlocal foldlevel=5",
        -- command = "setlocal conceallevel=2",
      })
    end
  },
}
