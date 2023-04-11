return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.splitjoin').setup()
    end,
    keys = { 'gS' },
  },
}

