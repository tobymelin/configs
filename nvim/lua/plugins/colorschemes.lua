return {
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd([[ colorscheme nightfly ]])
    end,
  },
  --  'Mofiqul/dracula.nvim',
  -- { 'dracula/vim', name = 'dracula' },
  -- 'Everblush/nvim',
  -- 'navarasu/onedark.nvim',
  -- 'EdenEast/nightfox.nvim',
  -- 'NLKNguyen/papercolor-theme',
  -- 'morhetz/gruvbox',
  -- 'tanvirtin/monokai.nvim',
  -- { 'catppuccin/nvim', name = 'catppuccin' },
  -- { 'folke/tokyonight.nvim', branch = 'main' },
}

