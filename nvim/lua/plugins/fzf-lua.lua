return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        -- Only works onze fzf 0.53 has been released
        -- files = {
        --   actions = { ["ctrl-q"] = { fn = require"fzf-lua".actions.file_sel_to_qf, prefix = "select-all" } }
        -- },
        grep = {
          multiline = 1,
        },
      })

      vim.api.nvim_create_augroup('startup', { clear = true })
      vim.api.nvim_create_autocmd('VimEnter', {
        group = 'startup',
        pattern = '*',
        callback = function()
          if vim.fn.getcwd() == vim.env.HOME or vim.g.neovide then
            return
          end
          -- Open file browser if argument is a folder
          local arg = vim.api.nvim_eval('argv(0)')
          if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
            vim.defer_fn(function()
              require('fzf-lua').files()
            end, 10)
          end
        end
      })
    end
  }
}
