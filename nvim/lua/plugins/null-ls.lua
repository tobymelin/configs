return {
  -- Prettier (requires null-ls and lspconfig)
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
      local null_ls = require("null-ls")

      vim.api.nvim_create_user_command('NullLsToggle', function ()
        require('null-ls').toggle('prettierd')
        require('null-ls').toggle('eslint_d')
      end, {})

      vim.api.nvim_create_user_command('NullLsDisable', function ()
        require('null-ls').disable('prettierd')
        require('null-ls').disable('eslint_d')
      end, {})

      local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
      local event = "BufWritePre" -- or "BufWritePost"
      local async = event == "BufWritePost"

      null_ls.setup({
        sources = {
            null_ls.builtins.formatting.prettierd,
            null_ls.builtins.formatting.eslint_d,
        },
        on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          -- vim.keymap.set("n", "<Leader>f", function()
          --   vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          -- end, { buffer = bufnr, desc = "[lsp] format" })

          -- format on save
          -- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
          vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = async })
            end,
            desc = "[lsp] format on save",
          })
        end
        --
        -- if client.supports_method("textDocument/rangeFormatting") then
        --   vim.keymap.set("x", "<Leader>f", function()
        --     vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
        --   end, { buffer = bufnr, desc = "[lsp] format" })
        -- end
        end,
      })
    end,
  },

  {
    'MunifTanjim/prettier.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = 'jose-elias-alvarez/null-ls.nvim',
    keys = {
      { '<leader>fp', '<cmd>Prettier<CR>' },
    },
  },
}

