return {
  -- LSP UI
  {
    'glepnir/lspsaga.nvim',
    event = "LspAttach",
    dependencies = 'neovim/nvim-lspconfig',
    keys = {
      -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      { 'K', '<cmd>Lspsaga hover_doc<CR>' },
    },
    opts = {
      lightbulb = {
        enable = false
      },
      symbol_in_winbar = {
        enable = false,
        hide_keyword = false,
      }
    },
  },
}
