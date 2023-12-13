return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.splitjoin').setup()

      require('mini.indentscope').setup()

      -- require('mini.base16').setup({
      --   palette = {
      --     base00 = '#1E1C31',
      --     base01 = '#2D2B40',
      --     base02 = '#3E3859',
      --     base03 = '#8A889D', -- comments
      --     base04 = '#ffffff',
      --     base05 = '#CBE3E7', -- default foreground
      --     base06 = '#7FE9C3',
      --     base07 = '#585273',
      --     base08 = '#F48FB1',
      --     base09 = '#F2B482',
      --     base0A = '#78A8FF',
      --     base0B = '#FFE6B3', -- strings
      --     base0C = '#63F2F1',
      --     base0D = '#F48FB1',
      --     base0E = '#A1EFD3',
      --     base0F = '#585273',
      --   },
      --   use_cterm = true,
      --   plugins = {
      --     default = true,
      --   },
      -- })
    end,
    keys = { 'gS' },
    event = 'VeryLazy',
  },
}

