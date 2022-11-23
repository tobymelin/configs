-- CONFIG FOR ORG-MODE
--
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
-- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    --additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  --ensure_installed = {'org'}, -- Or run :TSUpdate org
}

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
		org_priority_default = 3,
		org_priority_lowest = 5,
    org_todo_keywords = {'TODO(t)', 'WAIT', 'ACTV', '|', 'MVED', 'DONE'},
		org_capture_templates = {
			t = { description = 'Task', template = '* TODO %?\n %u' },
			n = { description = 'Note', template = '* %?\n %u' }
		}
})

