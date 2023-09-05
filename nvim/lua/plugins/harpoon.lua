-- Harpoon (also requires plenary)
return {
  'ThePrimeagen/harpoon',
  lazy = true,
  keys = {
    { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
    { "<leader>hi", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
    { "<leader>hj", "<cmd>lua require('harpoon.ui').nav_next()<CR>" },
    { "<leader>hk", "<cmd>lua require('harpoon.ui').nav_prev()<CR>" },
    { "<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
    { "<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
    { "<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>" },
    { "<leader>hf", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>" },
  },
}

