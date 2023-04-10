local nmap = require("tm.keymap").nmap

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
  'AndrewRadev/splitjoin.vim',

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
  lazy = false,
  config = function ()
    require('jabs').setup()
  end,
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
  'ThePrimeagen/harpoon',

-- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    event = 'VeryLazy',
    opts = {
      view = {
        width = 40,
      }
    }
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

  -- Git plugins
  -- 'TimUntersberger/neogit',
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    config = function()
      require 'diffview'.setup({})
    end,
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>' },
    },
  },

  'tpope/vim-fugitive',

  -- nvim completion
  'folke/lsp-trouble.nvim',

  'jose-elias-alvarez/typescript.nvim',
  -- 'ray-x/go.nvim',

  -- Show code signature overloads in lsp
  -- 'Issafalcon/lsp-overloads.nvim',

  -- GitHub Copilot
  {
    'github/copilot.vim',
    event = 'VeryLazy',
  },

  -- Code completion/signature help while typing
  'ray-x/lsp_signature.nvim',

  -- nvim test runner
  {
    'vim-test/vim-test',
    config = function ()
      vim.cmd([[ tmap <C-o> <C-\><C-n> ]])
    end
  },
}

