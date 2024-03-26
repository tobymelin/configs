return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies =  { "abeldekat/harpoonline", version = "*" },
    config = function ()
      local Harpoonline = require("harpoonline")
      Harpoonline.setup({
        on_update = function() require("lualine").refresh() end,
      })

      local lualine_c = { Harpoonline.format, "filename" }
      require("lualine").setup({
        sections = { lualine_c = lualine_c },
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

