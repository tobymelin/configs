return {
  -- npm install -g @vtsls/language-server
  -- https://github.com/yioneko/vtsls
  -- https://github.com/yioneko/nvim-vtsls
  {
    'yioneko/nvim-vtsls',
    enabled = true,
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    enabled = false,
  },
}
