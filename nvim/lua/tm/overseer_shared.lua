local M = {}

M.searchStringInFile = function (filename, searchStr)
    -- Open the file
    local file = io.open(filename, "r")

    -- Check if the file opened successfully
    if not file then
        print("Error opening file: " .. filename)
        return false
    end

    -- Read the file's contents
    local content = file:read("*a")
    file:close()

    -- Check for the string in the content
    if content:find(searchStr) then
        return true
    else
        return false
    end
end

M.tsBuilder = function (cmd)
  vim.notify("TSBUILDER:" .. cmd)
  return {
    cmd = { "npm" },
    args = { "run", cmd, "--", "--watch" },
    components = {
      "default_no_dispose",
      { "on_output_parse", problem_matcher = "$tsc-watch" },
      "on_result_diagnostics_quickfix",
      {
        "on_result_notify",
        on_change = false,
      },
    },
  }
end

return M
