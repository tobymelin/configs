require 'hop'.setup {}
require 'maximize'.setup {}
require 'trouble'.setup {}
require 'cmp'.setup {}
require 'nvim_comment'.setup {}
require 'cheatsheet'.setup {}
require 'no-neck-pain'.setup {}

require 'git'
require 'orgmode-conf'
require 'lsp-and-cmp'
require 'dap-conf'
require 'term'
require 'todo-comments-conf'

require 'telescope'.setup {
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
}
require("telescope").load_extension "file_browser"

require('lualine').setup({
  options = {
    theme = 'material',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  }
})

require("nvim-tree").setup({
  view = {
    width = 40,
  }
})

require 'tabout'.setup {
  tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
  backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
  act_as_tab = true, -- shift content if tab out is not possible
  act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
  default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  default_shift_tab = '<C-d>', -- reverse shift default action,
  enable_backwards = true, -- well ...
  completion = true, -- if the tabkey is used in a completion pum
  tabouts = {
    {open = "'", close = "'"},
    {open = '"', close = '"'},
    {open = '`', close = '`'},
    {open = '(', close = ')'},
    {open = '[', close = ']'},
    {open = '{', close = '}'}
  },
  ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  exclude = {} -- tabout will ignore these filetypes
}

vim.api.nvim_set_keymap('i', '<A-x>', "<Plug>(TaboutMulti)", {silent = true})
vim.api.nvim_set_keymap('i', '<A-z>', "<Plug>(TaboutBackMulti)", {silent = true})

require("indent_blankline").setup {
  space_char_blankline = " ",
}

