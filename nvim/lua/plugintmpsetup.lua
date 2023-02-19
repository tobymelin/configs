require 'git'
require 'orgmode-conf'
require 'lsp-and-cmp'
require 'dap-conf'

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

