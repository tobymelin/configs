return {
  {
    'jose-elias-alvarez/typescript.nvim',
    enabled = false,
  },

  -- npm install -g @vtsls/language-server
  -- https://github.com/yioneko/vtsls
  -- https://github.com/yioneko/nvim-vtsls
  {
    'yioneko/nvim-vtsls',
    -- enabled = false,
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    enabled = false,
  },

  { 'dmmulroy/ts-error-translator.nvim' },
}
