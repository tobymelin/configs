return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("lualine").setup({
        options = {
          -- theme = 'material',
          -- theme = 'base16',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
        },
      })
    end
  }
}
