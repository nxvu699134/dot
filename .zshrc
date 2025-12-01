export PATH="/opt/homebrew/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export TERM="xterm-256color" #this term support italic render
# export TERM="screen-256color"
export TERM="tmux-256color"
#
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
#
# zsh tmux settings
ZSH_TMUX_AUTOSTART='true'

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  pip
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  # vi-mode
  # zsh-vi-mode
  tmux
  git
)

autoload -U compinit && compinit

# Use this flag for surroot alias
ZSH_DISABLE_COMPFIX=true

# 10ms for key sequences
KEYTIMEOUT=10

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
#   ZSH_THEME="robbyrussell"
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias v="nvim"
export EDITOR='nvim'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export DENO_INSTALL="/home/joey/.deno"
# export PATH="$DENO_INSTALL/bin:$PATH"

# export GOROOT=$HOME/.go
# export GOPATH=$HOME/Workspace/Golang
# export GOBIN=$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin:$GOBIN

export PATH="$HOME/.cargo/bin:$PATH"
export BAT_THEME="OneHalfDark"

export PGDATA=/usr/local/pgsql/data

alias suroot='sudo -E -s'
alias lgit='lazygit'
alias pn='pnpm'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(fnm env --use-on-cd)"

# pnpm
# export PNPM_HOME="/Users/joey/.pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end

export CONFIG_DIR="$HOME/.config/lazygit"
