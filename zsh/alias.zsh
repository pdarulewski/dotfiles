#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='colorls -lAh --sd'

alias diff='diff --side-by-side -W $(( $(tput cols) - 2 ))'

function mkd() {
  mkdir -p "$@" && cd "$_";
}

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

for file in $HOME/.config/zsh/scripts/*.zsh(.)
do
  source $file;
done;
