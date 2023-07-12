return {
  name = "TypeScript Build (watch)",
  builder = function()
    return {
      cmd = { "npm" },
      args = { "run", "build:typescript", "--", "--watch" },
      components = { "default_no_dispose" },
    }
  end,
  condition = {
    filetype = { "typescript" },
  },
}
