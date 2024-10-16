local slow_format_filetypes = {}
slow_format_filetypes['typescript'] = true

local M = {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      javascript = { 'eslint', 'prettier' },
      typescript = { 'eslint_d', 'prettier' },
      go = { 'goimports', 'gofmt' },
    },
    formatters = {
      goimports = {
        prepend_args = { '-local', 'github.com/tokenweb3' },
      },
    },
    format_on_save = function(bufnr)
      if not vim.g.autoformat then
        return
      end

      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local function on_format(err)
        if err and err:match("timeout$") then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 200, lsp_fallback = true }, on_format
    end,
    format_after_save = function(bufnr)
      if not vim.g.autoformat then
        return
      end

      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      return { lsp_fallback = true }
    end,
  },
}

return M
