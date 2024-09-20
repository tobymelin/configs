return {
  -- Vue.js syntax highlighting
  {
    'leafOfTree/vim-vue-plugin',
    enabled = false,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "vue",
        callback = function()
          vim.cmd('set syntax=vue')
        end
      })
    end
  }
}
