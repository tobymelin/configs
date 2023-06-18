return {
  -- Common Dependencies
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons', -- optional, for file icons

  -- Utilities
  'sudormrfbin/cheatsheet.nvim',

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
      })
    end
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
    require('jabs').setup()
  end,
  keys = {
    { '<C-Tab>', '<cmd>JABSOpen<CR>' },
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

  -- Leap (hop alternative for navigation)
  {
    'ggandor/leap.nvim',
    config = function ()
      require('leap').add_default_mappings()
    end
  },


-- Multiline selection (Sublime-like)
  { 'mg979/vim-visual-multi', branch = 'master'},

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

  -- Harpoon (also requires plenary)
  {
    'ThePrimeagen/harpoon',
    lazy = true,
    keys = {
      { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
      { "<leader>hi", "<cmd>lua require('harpoon.mark').add_file()<CR>" }
    },
  },

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

  {
    'stevearc/oil.nvim',
    opts = {},
    keys = {
      { '<leader>to', '<cmd>Oil<CR>' },
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

  {
    'jose-elias-alvarez/typescript.nvim',
    enabled = false,
  },

  -- npm install -g @vtsls/language-server
  -- https://github.com/yioneko/vtsls
  -- https://github.com/yioneko/nvim-vtsls
  'yioneko/nvim-vtsls',

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

  -- nvim test runner
  {
    'vim-test/vim-test',
    config = function ()
      vim.cmd([[ tmap <C-o> <C-\><C-n> ]])
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

