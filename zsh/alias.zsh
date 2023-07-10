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

function nvim_with_poetry() {
  source "$(poetry env info --path)/bin/activate"
  nvim $*;
  deactivate;
}

function nvim_with_venv() {
  source venv/bin/activate
  nvim $*;
  deactivate;
}


function mkd() {
  mkdir -p "$@" && cd "$_";
}

function poetry_activate() {
	if [ -e pyproject.toml ]; then
    if poetry env info --path &> /dev/null; then
      nvim_with_poetry $*;

    elif [ -e venv/ ]; then
      nvim_with_venv $*;

    else
      nvim $*;

    fi

  elif [ -e venv/ ]; then
      nvim_with_venv $*;

  else
    nvim $*;

  fi
}

alias s='source venv/bin/activate'
alias p='poetry shell'

alias vi='poetry_activate && echo -e "\033]${PWD}\007"'

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
