-- LSP plugin for Lua/Neovim configs
return {
  {
    'folke/neodev.nvim',
    lazy = true,
    config = function ()
      -- Set up Neodev (must happen before lspconfig)
      require("neodev").setup({
        -- override = function(root_dir, library)
        -- override = function(_, library)
          -- if root_dir:find('dev/configs') then
          --   library.enabled = true
          --   library.plugins = true
          -- end
            -- library.enabled = true
            -- library.plugins = true
        -- end,
      })
    end,
  }
}

