local nmap = require("tm.keymap").nmap

return {
  {
    'vim-test/vim-test',
    dependencies = { 'tpope/vim-dispatch' },
    config = function ()
      -- vim-test mappings
      nmap { "<leader>rt", "<cmd>TestNearest<CR>" }
      nmap { "<leader>rf", "<cmd>TestFile<CR>" }
      nmap { "<leader>ra", "<cmd>TestSuite<CR>" }
      nmap { "<leader>rl", "<cmd>TestLast<CR>" }
      nmap { "<leader>rg", "<cmd>TestVisit<CR>" }

      nmap { "<leader>ru", "<cmd>Ava % -u<CR>" }
      nmap { "<leader>rr", "<cmd>Ava<CR>" }
    end,
    init = function ()
      vim.cmd([[
        tmap <C-o> <C-\><C-n>

        let g:test#javascript#ava#file_pattern = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
        let g:test#runner_commands = ['Ava', 'Jest']
      ]])
    end
  },
}
