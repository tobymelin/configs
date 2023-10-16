local M = {
  'salorak/whaler.nvim',
  event = 'VeryLazy',
  config = function ()
    require('telescope').setup({
      extensions = {
        whaler = {
            -- Whaler configuration
            file_explorer = "oil",
            directories = {
              "/Users/toby/dev",
              "/Users/toby/dev-token",
            },
        }
      }
    })

    require('telescope').load_extension('whaler')
  end,
  keys = {
    {
      "<leader>fw",
      mode = { "n" },
      function()
        local w = require('telescope').extensions.whaler.whaler
        w({
          -- Settings can also be called here
        })
      end
    }
  },
}

return M
