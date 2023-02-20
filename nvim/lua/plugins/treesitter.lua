return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
      highlight = {
        enable = true,
        --additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
      },
      ensure_installed = {
        'c',
        'lua',
        'help',
        'markdown_inline',
        'org',
        'typescript',
        'vim',
      }, -- Or run :TSUpdate org
    }
  },
}

