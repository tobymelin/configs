return {
  -- LSP UI
  {
    'nvimdev/lspsaga.nvim',
    enabled = false,
    event = "LspAttach",
    dependencies = 'neovim/nvim-lspconfig',
    keys = {
      { 'K', '<cmd>Lspsaga hover_doc<CR>' },
      { 'gp', '<cmd>Lspsaga peek_definition<CR>' },
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
