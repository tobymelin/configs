return {
  {
    'mfussenegger/nvim-lint',
    config = function ()
      require('lint').linters_by_ft = {
        go = { 'golangcilint' },
      }
    end,
    keys = {
      { 'rl', "<cmd>lua require('lint').try_lint()<CR>" },
    },
  },
}
