-- Replicated from TJ Devries' nvim configs
local M = {}

M.imap = function(tbl)
  vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.vmap = function(tbl)
  vim.keymap.set("v", tbl[1], tbl[2], tbl[3])
end

return M
