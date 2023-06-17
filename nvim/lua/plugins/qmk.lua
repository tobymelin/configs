return {
  'codethread/qmk.nvim',
  config = function()
    ---@type qmk.UserConfig
    local conf = {
      name = 'LAYOUT_planck_grid',
      layout = {
          '_ x x x x x x _ x x x x x x',
          '_ x x x x x x _ x x x x x x',
          '_ x x x x x x _ x x x x x x',
          '_ x x x x x x _ x x x x x x',
      },
      auto_format_pattern = nil,
    }

    require('qmk').setup(conf)
  end
}
