# Environment variables - https://fishshell.com/docs/current/cmds/set.html
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"

# fish_add_path "/opt/homebrew/bin/"
# fish_add_path "/opt/homebrew/share/google-cloud-sdk/bin"
# fish_add_path "$HOME/bin"

if status is-interactive
  function ..   ; cd .. ; end
  function ...   ; cd ../.. ; end
  function ....   ; cd ../../.. ; end
  function .....   ; cd ../../../.. ; end

  function grep     ; command grep --color=auto $argv ; end

  # Commands to run in interactive sessions can go here
  alias c='clear'
  alias d='du -h'
  alias di='colordiff -Nau'
  alias ibrew='arch -x86_64 /usr/local/bin/brew'
  alias kc='kubectl'
  alias l='ls'
  alias la='ls -a'
  alias ll='ls -l'
  alias lla='ls -la'
  alias m='mv -v'
  alias n='nnn -A'
  alias p='pacman'
  alias py='python3'
  alias rr='rm -rv'
  alias r='rm -v'
  alias s='sudo'
  alias sc='tmux'
  alias sudo='sudo '
  alias sx='startx'
  alias v="nvim"
  alias x='exit'
  alias zxc='code .'

  # Git aliases
  alias lg='lazygit'
  alias g='git'
  alias gb='git branch'
  alias gc='git commit'
  alias gcam='git commit -am'
  alias gcm='git commit -m'
  alias gco='git checkout'
  alias gd='git diff'
  alias gdt='git difftool'
  alias gl='git --no-pager log --oneline -10'
  alias gbranches='git branch --format "%(refname:short)     %(upstream)"'
  alias gmt='git mergetool'
  alias gp='git push'
  alias gs='git status'
  alias glf='git log --oneline --max-count 15 | fzf | sed -e "s/ .*//" | pbcopy'

  alias nr='npm run'

  abbr -a :cp --position anywhere --set-cursor '| pbcopy %'
  abbr -a :d --position anywhere --set-cursor '| delta %'
  abbr -a :g --position anywhere --set-cursor '| grep %'
  abbr -a :gi --position anywhere --set-cursor '| grep -i %'
  abbr -a :h --position anywhere --set-cursor '| head %'
  abbr -a :p --position anywhere --set-cursor '| less -R %'
  abbr -a :t --position anywhere --set-cursor '| tail %'
  abbr -a :t1 --position anywhere --set-cursor '| tail -n 1 %'
  abbr -a :w --position anywhere --set-cursor '| wc -l %'

  abbr !! --position anywhere --function last_history_item
end

# starship init fish | source
