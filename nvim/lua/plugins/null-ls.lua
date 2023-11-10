local autoformat_types = {}
autoformat_types["javascript"] = true
autoformat_types["typescript"] = true
autoformat_types["go"] = true

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
            vim.keymap.set("n", "<leader>fr", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), async = true })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end

          -- format on save
          vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
          vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function()
              if not vim.g.autoformat then
                return
              end

              -- Do not autoformat if filetype is not in autoformat_types
              if autoformat_types[vim.bo.filetype] == nil then
                vim.notify('Not autoformatting ' .. vim.bo.filetype)
                return
              end

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
        -- end,
      })
    end,
  },

  {
    'MunifTanjim/prettier.nvim',
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = 'jose-elias-alvarez/null-ls.nvim',
    -- keys = {
    --   { '<leader>fp', '<cmd>Prettier<CR>' },
    -- },
  },
}

