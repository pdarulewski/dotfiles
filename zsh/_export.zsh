#!/usr/bin/env zsh

export THEME="ocean"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/Users/pd/google-cloud-sdk/bin/:$PATH"

export KUBE_EDITOR="nvim"

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export PYTORCH_ENABLE_MPS_FALLBACK=1

# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

export EDITOR='vi'
export PROJECTS="$HOME/repo"

# crontab editor on MacOS
export VISUAL='nvim'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='colorls -lAh --sd'

alias diff='diff --side-by-side -W $(( $(tput cols) - 2 ))'

function mkd() {
  mkdir -p "$@" && cd "$_";
}

function envir() {
  [ ! -f .env ] || export $(grep -v '^#' .env | xargs)
}

# change kitty tab name
function change_title_bar () {
	local statusline="${PWD##*/}"
	case $TERM in
		xterm*|gnome*)
	    		print -Pn "\e]0;$statusline\a";;
		screen*|tmux*)
	    		print -Pn "\ek$statusline\e\\";;
	esac
}

precmd () {
    change_title_bar
}

function chpwd_do_ls () {
  l
}

chpwd_functions=( chpwd_do_ls )

for file in $HOME/.config/zsh/scripts/*.zsh(.)
do
  source $file;
done;


for file in $HOME/.config/**/export.zsh(.)
do
  source $file;
done;
