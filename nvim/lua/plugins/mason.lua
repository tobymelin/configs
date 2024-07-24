return {
  {
    "williamboman/mason.nvim",
    event = 'VeryLazy',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    event = 'VeryLazy',
    config = function()
      require('mason-lspconfig').setup({
        -- ensure_installed = { 'eslintd' },
        automatic_installation = true,
      })
    end
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = 'VeryLazy',
    config = function()
      require('mason-nvim-dap').setup({
        automatic_installation = true,
      })
    end
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = 'VeryLazy',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = { 'eslint_d', 'prettierd' },
      })
    end
  },
}
