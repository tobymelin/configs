set -g dev_root "$HOME/dev"

# General config directories, etc.
function c.aoc --wraps=cd --description="cd to Advent of Code"
  cd "$dev_root/aoc/2023"
end

function c.fish --wraps=cd --description="cd to fish config"
  cd "$HOME/.config/fish"
end

function c.conf --wraps=cd --description="cd to configs"
  cd "$dev_root/configs"
end

function c.nvim --wraps=cd --description="cd to nvim config"
  cd "$dev_root/configs/nvim"
end

function c.qmk --wraps=cd --description="cd to qmk config"
  cd "$HOME/qmk_firmware/keyboards/planck/rev7/keymaps/tobymelin"
end

function c.zmk --wraps=cd --description="cd to zmk config"
  cd "$HOME/var/keyboards/zmk-config"
end
