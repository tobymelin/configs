vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "rounded",
-- })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- if client.server_capabilities.signatureHelpProvider then
  --   require('lsp-overloads').setup(client, {})
  -- end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = 'folke/neodev.nvim',
    config = function ()
      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

      require("typescript").setup {
        -- lspconfig settings
        server = {
          on_attach = on_attach,
          capabilities = capabilities,
          root_dir = function() return vim.loop.cwd() end,
          -- enable snippet completions
          completions = {
            completeFunctionCalls = true
          },
        }
      }

      require'lspconfig'.eslint.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function() return vim.loop.cwd() end
      }

      require'lspconfig'.lua_ls.setup {
        on_attach = on_attach,
      }

      require'lspconfig'.gopls.setup {}
      require'lspconfig'.vuels.setup {}
    end,
  }
}

