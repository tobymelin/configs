return {
  -- LSP UI
  {
    'glepnir/lspsaga.nvim',
    keys = {
      -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      { 'K', '<cmd>Lspsaga hover_doc<CR>' },
    },
    opt = {
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
