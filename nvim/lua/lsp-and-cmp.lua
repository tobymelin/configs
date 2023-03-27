vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require'cmp'

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

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Set up nvim-cmp.
cmp.setup({
  window = {
    documentation = cmp.config.window.bordered()
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set up Neodev (must happen before lspconfig)
require("neodev").setup({
  override = function(root_dir, library)
    -- if root_dir:find('dev/configs') then
    --   library.enabled = true
    --   library.plugins = true
    -- end
      library.enabled = true
      library.plugins = true
  end,
})

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

require'lspconfig'.lua_ls.setup {}
require'lspconfig'.gopls.setup {}
require'lspconfig'.vuels.setup {}

vim.g.go_doc_popup_window = 1

vim.keymap.set('n', '<leader>gr', "<cmd>GoRun<CR>", opts)
vim.keymap.set('n', '<leader>gt', "<cmd>GoTest<CR>", opts)
vim.keymap.set('n', '<leader>fx', "<cmd>EslintFixAll<CR>", opts)
vim.keymap.set('n', '<leader>fp', "<cmd>Prettier<CR>", opts)


require("lspsaga").setup{
  lightbulb = {
    enable = false
  },
  symbol_in_winbar = {
    enable = false
  }
}

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

local null_ls = require("null-ls")

-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"

null_ls.setup({
  sources = {
      null_ls.builtins.formatting.prettier.with({
        only_local = "node_modules/.bin",
      }),
  },
  -- on_attach = function(client, bufnr)
  -- if client.supports_method("textDocument/formatting") then
    -- vim.keymap.set("n", "<Leader>f", function()
    --   vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    -- end, { buffer = bufnr, desc = "[lsp] format" })

    -- format on save
    -- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
  --   vim.api.nvim_create_autocmd(event, {
  --     buffer = bufnr,
  --     group = group,
  --     callback = function()
  --       vim.lsp.buf.format({ bufnr = bufnr, async = async })
  --     end,
  --     desc = "[lsp] format on save",
  --   })
  -- end
  --
  -- if client.supports_method("textDocument/rangeFormatting") then
  --   vim.keymap.set("x", "<Leader>f", function()
  --     vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
  --   end, { buffer = bufnr, desc = "[lsp] format" })
  -- end
-- end,
})

require('lsp_signature').setup()

require('prettier').setup()

