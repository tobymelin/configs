return {
  {
    'fatih/vim-go',
    build = ':GoUpdateBinaries',
    config = function ()
      vim.g.go_doc_popup_window = 1
    end,
    keys = {
      { '<leader>gr', '<cmd>GoRun<CR>' },
      { '<leader>gt', '<cmd>GoTest<CR>' },
    },
  },
}

