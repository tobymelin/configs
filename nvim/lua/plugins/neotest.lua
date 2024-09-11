local nmap = require("tm.keymap").nmap

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/neotest-plenary",
    {
      -- "neotest/neotest-ava",
      -- dev = true,
      dir = "/Users/tobymelin/.local/share/nvim/neotest-ava",
    },
    "vim-test/vim-test",
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    Nt = require('neotest')

    require("neotest").setup({
      -- your neotest config here
      adapters = {
        require("neotest-go"),
        require("neotest-ava"),
        require("neotest-plenary"),
        -- require("neotest-vim-test")({ allow_file_types = { "typescript", "javascript" } }),
      },
    })

    -- vim-test configs
    vim.cmd([[
      tmap <C-o> <C-\><C-n>

      let g:test#javascript#ava#file_pattern = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
      let g:test#typescript#ava#file_pattern = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
      let g:test#runner_commands = ['Ava', 'Jest']
    ]])
  end,
  keys = {
    { '<leader>tk', "<cmd>lua require('neotest').output.open()<CR>" },
    { '<leader>tK', "<cmd>lua require('neotest').output.open({ last_run = true })<CR>" },
    { '<leader>ts', "<cmd>lua require('neotest').summary.toggle()<CR>" },
    { '<leader>rt', "<cmd>lua require('neotest').run.run()<CR>" },
    { '<leader>rf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>" },
    { '<leader>ra', "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>" },
    { '<leader>ru', '<cmd>Ava % -u<CR>' },
    { '<leader>rr', '<cmd>Ava<CR>' },

    -- { '<leader>rf', "<cmd>TestFile<CR>" },
    -- { '<leader>ra', "<cmd>TestSuite<CR>" },
    -- { '<leader>rl', "<cmd>TestLast<CR>" },
    -- { '<leader>rg', "<cmd>TestVisit<CR>" },
  },
}
