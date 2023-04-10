return {
  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    config = function()
      require 'toggleterm'.setup {
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
          border = "double",
        },
      }

      local Terminal  = require('toggleterm.terminal').Terminal

      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      function _ava_toggle(update)
        local _curfn = vim.fn.expand("%")

        local cmd = "TermExec cmd=\"npx ava "

        if update == true then
          cmd = cmd .. "-u "
        end

        vim.api.nvim_command(cmd .. _curfn .. "\"")
      end

      function _lint_toggle()
        vim.api.nvim_command("TermExec cmd=\"npm run lint\"")
      end

      vim.api.nvim_set_keymap("n", "<leader>L", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>lua _ava_toggle()<CR>", {noremap = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>ru", "<cmd>lua _ava_toggle(true)<CR>", {noremap = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>ry", "<cmd>lua _lint_toggle()<CR>", {noremap = true, silent = true})
    end
  },
}

