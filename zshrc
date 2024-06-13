# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/opt/ruby/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="jreese"
#ZSH_THEME="refined"
ZSH_THEME="dst"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Disable compaudit message due to /usr/local permissions (TM addition)
ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python colorize colored-man-pages z git-prompt git-extras gh golang gcloud zsh-autosuggestions npm)

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

if test -f ".zshrc.local"; then
	source .zshrc.local
fi

export ORGDIR="$HOME/org"
#export TERM='xterm-256color'

if type nvim &> /dev/null; then
				export EDITOR='nvim'
else
				export EDITOR='vim'
fi

alias c='clear'
alias d='du -h'
alias di='colordiff -Nau'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
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
alias v="$EDITOR"
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

alias -g :cp='| pbcopy'
alias -g :d='| delta'
alias -g :g='| grep'
alias -g :gi=' | grep -i'
alias -g :h='| head'
alias -g :p='| less -R'
alias -g :t='| tail'
alias -g :t1='| tail -n 1'
alias -g :w='| wc -l'

# Default applications based on file endings
alias -s {md,py}=$VSCODE
alias -s pdf='open -a Preview'
alias -s git='git clone'

mkd() {
	mkdir -p "$1"
	cd "$1"
}

mktmp() {
	mkdir -p "/tmp/$1"
	cd "/tmp/$1"
}

#alias vorg="v $ORGDIR/weekly/$(date -v1w +"%y%m%d").org $ORGDIR/refile.org"
#alias vorg="v $ORGDIR/weekly/$(date -v1w +"%y%m%d").org"
vorg() {
	orgfn=$ORGDIR/weekly/$(date -v1w +"%y%m%d").org

	if [[ !( -e $orgfn ) ]]; then
		touch $orgfn
	fi

	#$EDITOR $ORGDIR/weekly/$(date -v1w +"%y%m%d").org
	$EDITOR $orgfn
}

llm() {
  cd "$(llama "$@")"
}

pycalc() {
	python3 -c \"from math import *; print(${@})\"
}

# nvm-specific commands
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export PATH="/opt/homebrew/bin:$PATH"

# brew-specific commands
if type brew &> /dev/null; then
	#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
	# export PATH="$(brew --prefix)/lib/ruby/gems/2.7.0/bin:$PATH"
	# export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
	export PATH="$(brew --prefix)/lib/ruby/gems/3.2.0/bin:$PATH"
	export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

	#export LDFLAGS="-L/opt/homebrew/opt/ruby@2.7/lib"
	#export CPPFLAGS="-I/opt/homebrew/opt/ruby@2.7/include"
	#export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby@2.7/lib/pkgconfig"
fi

# go path
if [ -d $HOME/go/bin ]; then
  export GOPATH=$HOME/go
  export GOBIN=$HOME/go/bin
  export PATH=$PATH:$GOPATH/bin
  export GOPRIVATE="github.com/tokenweb3/*"
fi

if [ -d $HOME/Library/Android/sdk ]; then
	export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
	export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# For gcloud completion and adding to PATH
#source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
#source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source local environment variable config if it exists
[ -f ~/.env.zsh ] && source ~/.env.zsh


source /Users/tobymelin/.config/broot/launcher/bash/br

eval "$(rbenv init - zsh)"
