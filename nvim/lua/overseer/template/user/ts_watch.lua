return {
  name = "TypeScript Build (watch)",
  builder = function()
    return {
      cmd = { "npm" },
      args = { "run", "build:typescript", "--", "--watch" },
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
  end,
  condition = {
    filetype = { "typescript" },
  },
}
