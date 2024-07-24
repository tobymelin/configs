return {
  'codethread/qmk.nvim',
  ft = 'dts',
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

    ---@type qmk.UserConfig
    local corne_conf = {
      name = 'LAYOUT_corne',
      layout = {
        '_ x x x x x x _ x x x x x x',
        '_ x x x x x x _ x x x x x x',
        '_ x x x x x x _ x x x x x x',
        '_ _ _ _ x x x _ x x x _ _ _',
      },
      variant = 'zmk',
      auto_format_pattern = '*.keymap',
    }

    require('qmk').setup(corne_conf)
  end
}
