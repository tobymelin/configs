local tsbuilder = function (cmd)
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

return {
  name = "TypeScript Build (watch)",
  builder = function()
    return tsbuilder("build:typescript")
  end,
  condition = {
    -- filetype = { "typescript" },
    callback = function (opts)
      local f = vim.fs.find('tsconfig.json', { upward = true, type = "file", path = opts.dir, stop = vim.fn.getcwd() })
      if f ~= nil then
        local fn = 'package.json'
        local gcmd = 'grep "build:typescript" ' .. fn
        local fnd = os.execute(gcmd)
        if fnd == 0 then
          return true
        end
      end
      return false
    end
  },
}
