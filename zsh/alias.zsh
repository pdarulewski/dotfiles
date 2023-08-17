#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='colorls -lAh --sd'

alias ga='git add'
alias gaa='git add --all'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gbd='git branch -D'
alias gst='git status'
alias gcmsg='git commit -m'
function grbi() {
  git rebase -i HEAD~$1
}
alias grbia='git rebase -i `git merge-base feature master`'
alias grbc='git rebase --continue'
alias gl='git log --oneline --decorate --graph'

alias k='kubectl'
alias kctx='kubectx'
#
alias ghpr='gh pr create'
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
