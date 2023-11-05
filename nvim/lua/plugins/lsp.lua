vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "rounded",
-- })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- if client.server_capabilities.signatureHelpProvider then
  --   require('lsp-overloads').setup(client, {
  --     keymaps = {
  --       next_signature = "<C-j>",
  --       previous_signature = "<C-k>",
  --     },
  --   })
  -- end

  -- if client.name == 'eslint' then
  --   local ns = vim.lsp.diagnostic.get_namespace(client.id)
  --   vim.diagnostic.disable(nil, ns)
  -- end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)

  vim.keymap.set('n', 'vrr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'vca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'vrn', vim.lsp.buf.rename, bufopts)
end

return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'folke/neodev.nvim',
      'ray-x/lsp_signature.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function ()
      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

      -- require("typescript").setup {
      --   -- lspconfig settings
      --   server = {
      --     on_attach = on_attach,
      --     capabilities = capabilities,
      --     root_dir = function() return vim.loop.cwd() end,
      --     -- enable snippet completions
      --     completions = {
      --       completeFunctionCalls = true
      --     },
      --   }
      -- }

      -- require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config
      -- require("lspconfig").vtsls.setup({ --[[ your custom server config here ]] })

      require'lspconfig'.eslint.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function() return vim.loop.cwd() end
      }
      require'lspconfig'.lua_ls.setup {
        on_attach = on_attach,
      }
      require'lspconfig'.gopls.setup {
        on_attach = on_attach,
      }
      require'lspconfig'.vuels.setup {}

      -- https://github.com/jose-elias-alvarez/typescript.nvim/issues/19
      -- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils (search filter)
      -- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils/blob/main/lua/nvim-lsp-ts-utils/client.lua#L47-L110
      -- https://github.com/neovim/neovim/issues/20745
      local function filter_diagnostics(diagnostic)
        -- Filter out all diagnostics from sumneko_lua
        -- if diagnostic.source:find('typescript', 1, true) then
        -- if diagnostic.source:find('eslint', 1, true) then
        --   return false
        -- end
        return true
      end

      vim.api.nvim_create_user_command('LspDiagDisable', function ()
        local clients = vim.lsp.get_active_clients({ name = 'eslint' })[1]
        local clients2 = vim.lsp.get_active_clients({ name = 'tsserver' })[1]

        local ns1 = vim.lsp.diagnostic.get_namespace(clients.id)
        local ns2 = vim.lsp.diagnostic.get_namespace(clients2.id)

        vim.diagnostic.disable(nil, ns1)
        vim.diagnostic.disable(nil, ns2)
      end, {})

      -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      --   vim.lsp.diagnostic.on_publish_diagnostics, {
      --     -- Enable underline, use default values
      --     underline = true,
      --     -- Use a function to dynamically turn signs off
      --     -- and on, using buffer local variables
      --     signs = true
      --   }
      -- )

      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        function(_, result, ctx, config)
          result.diagnostics = vim.tbl_filter(filter_diagnostics, result.diagnostics)
          -- vim.print(result.diagnostics)
          vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
        end,
        {
          underline = true,
          signs = true,
        }
      )

    end,
  }
}

