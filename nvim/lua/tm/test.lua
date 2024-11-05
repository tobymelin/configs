local function getLspInfo()
  -- Create the params for the LSP request
  local params = vim.lsp.util.make_position_params()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- Debugging information
  print("Cursor position: row =", row, "col =", col)
  print("Initial params: ", vim.inspect(params))
  -- Adjust the position if the cursor is at the beginning of the line
  if col == 0 then
    params.position.character = 1
  end
  -- Debugging information
  print("Adjusted params: ", vim.inspect(params))
  -- -- Ensure the LSP client is attached
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    print("No LSP client attached")
    return
  else
    print("LSP client attached")
  end
  -- -- Check if the client supports signatureHelp
  local client = clients[1]
  if not client.server_capabilities.signatureHelpProvider then
    print("LSP server does not support signatureHelp")
    return
  else
    print("LSP server supports signatureHelp")
  end
  -- Send the LSP request
  -- local result = vim.lsp.buf_request_sync(0, "textDocument/hover", params, 10000)
  local result = vim.lsp.buf_request_sync(0, "textDocument/completion", params, 10000)
  print("Result: ", vim.inspect(result))
  -- local item = result.items
  print('qweoijsadoqhweoijasd')
  if result == nil then
    return
  end
  local a = result[1].result.items[2]
  local result = vim.lsp.buf_request_sync(0, "completionItem/resolve", a, 10000)
  print("Result: ", vim.inspect(result))
end

vim.api.nvim_create_user_command('TestLsp', getLspInfo, {})
