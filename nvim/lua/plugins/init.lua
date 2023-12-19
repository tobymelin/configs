return {
  -- Common Dependencies
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons', -- optional, for file icons

  -- Utilities
  'sudormrfbin/cheatsheet.nvim',
  {
    'NvChad/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  },
  {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>Z', '<cmd>ZenMode<CR>' },
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'rcarriga/nvim-notify',
    config = function ()
      vim.notify = require('notify')
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      indent = { char = '▏', tab_char = '▏' },
      scope = { enabled = false },
    },
  },

  -- Type gS to split single line into a multi-liner
  -- 'AndrewRadev/splitjoin.vim',

  -- nvim-surround, use ys{motion}{char}, ds{char} and cs{target}{replacement} to change surround characters
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function ()
      require('nvim-surround').setup()
    end
  },

-- Buffer Switcher Window
{
  'matbme/JABS.nvim',
  lazy = true,
  config = function ()
    require('jabs').setup({
      width = 80,
    })
  end,
  keys = {
    -- { '<C-Tab>', '<cmd>JABSOpen<CR>' },
    { '<leader><Tab>', '<cmd>JABSOpen<CR>' },
  },
},

-- Buffer auto-close if too many open
{
  'axkirillov/hbac.nvim',
  config = function ()
    require("hbac").setup({
      threshold = 8,
    })
  end
},

-- Markdown plugin
  'ixru/nvim-markdown',

-- Hop (Navigation plugin)
  {
    'phaazon/hop.nvim',
    lazy = true,
    config = function()
      require('hop').setup()
    end,
    keys = {
      { '<leader>/', '<cmd>HopChar2<CR>' },
    },
  },

-- Toggle line comments
  {
    'terrortylor/nvim-comment',
    config = function ()
      require('nvim_comment').setup()
    end
  },

-- Maximize window splits
  {
    'declancm/maximize.nvim',
    lazy = true,
    config = function ()
      require('maximize').setup()
    end,
    keys = {
      {
        '<leader>z',
        function ()
          require('maximize').toggle()
        end
      },
    },
  },

-- VimTeX
  'lervag/vimtex',

-- Vim Markdown plugin
  'godlygeek/tabular',
  'preservim/vim-markdown',

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    opts = {
      view = {
        width = 40,
      }
    },
    keys = {
      { "<leader>tt", '<cmd>NvimTreeToggle<CR>' },
      { '<C-t>', '<cmd>NvimTreeFindFile<CR>' },
    },
  },

-- Tabline plugin
  'mkitt/tabline.vim',

-- Center buffers
  {
    'shortcuts/no-neck-pain.nvim',
    lazy = true,
    keys = {
     { '<leader>C', '<cmd>NoNeckPain<CR>' },
    },
  },

  -- nvim completion
  'folke/lsp-trouble.nvim',

  -- Show code signature overloads in lsp
  -- 'Issafalcon/lsp-overloads.nvim',

  -- GitHub Copilot
  {
    'github/copilot.vim',
    event = 'VeryLazy',
  },

  -- Code completion/signature help while typing
  {
    'ray-x/lsp_signature.nvim',
    lazy = false,
    config = function ()
      require('lsp_signature').setup()
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
}

