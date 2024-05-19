-- Harpoon (also requires plenary)
return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  lazy = true,
  config = function ()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>hi", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hj", function() harpoon:list():next() end)
    vim.keymap.set("n", "<leader>hk", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end)
  end,
  -- keys = {
  --   { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
  --   { "<leader>hi", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
  --   { "<leader>hj", "<cmd>lua require('harpoon.ui').nav_next()<CR>" },
  --   { "<leader>hk", "<cmd>lua require('harpoon.ui').nav_prev()<CR>" },
  --   { "<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
  --   { "<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
  --   { "<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>" },
  --   { "<leader>hf", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>" },
  -- },
}

