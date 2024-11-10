---@param ctx blink.cmp.CompletionRenderContext
---@return blink.cmp.Component
local function render_item(ctx)
  local map = {
    ["blink.cmp.sources.lsp"] = "[LSP]",
    ["blink.cmp.sources.path"] = "[PATH]",
    ["blink.cmp.sources.snippets"] = "[SNIP]",
  }
  if ctx.item.label == 'qwe' then
    print(vim.inspect(ctx))
  end
  return {
    {
      " " .. ctx.item.label,
      fill = true,
      -- hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
    },
    { string.format(" %s%s%-10s", ctx.kind_icon, ctx.icon_gap, ctx.kind), hl_group = "BlinkCmpKind" .. ctx.kind },
    {
      string.format("%6s ", map[ctx.item.source] or "UNKNOWN"),
      hl_group = "BlinkCmpSource",
    },
  }
end

return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- On musl libc based systems you need to add this flag
  -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

  opts = {
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'normal',

    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } }

    -- experimental signature help support
    trigger = { signature_help = { enabled = true } },

    keymap = {
      preset = 'default',

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<CR>'] = { 'select_and_accept', 'fallback' },
      ['<Tab>'] = { 'select_and_accept' },
    },

    windows = {
      -- autocomplete = {
      --   draw = render_item,
      -- },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
      },
    },
  }
}
