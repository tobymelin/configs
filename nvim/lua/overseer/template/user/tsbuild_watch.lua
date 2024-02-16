local searchStringInFile = require('tm.overseer_shared').searchStringInFile
local tsBuilder = require('tm.overseer_shared').tsBuilder

return {
  name = "npm build:typescript (watch)",
  builder = function()
    return tsBuilder("build:typescript")
  end,
  condition = {
    -- filetype = { "typescript" },
    callback = function (opts)
      local f = vim.fs.find('tsconfig.json', { upward = true, type = "file", path = opts.dir, stop = vim.fn.getcwd() })
      if f ~= nil then
        local fn = vim.fn.getcwd() .. '/package.json'

        if searchStringInFile(fn, '"build:typescript":') then
          return true
        end
      end
      return false
    end
  },
}
