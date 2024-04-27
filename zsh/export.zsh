#!/usr/bin/env zsh

# crontab editor on MacOS
export VISUAL='nvim'

export HOSTALIASES=$HOME/.hosts

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.gem/ruby/3.3.0/bin
export PATH="/usr/local/opt/ruby/bin:$PATH"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='colorls -lAh --sd'

alias diff='diff --side-by-side -W $(( $(tput cols) - 2 ))'

function mkd() {
	mkdir -p "$@" && cd "$_"
}

function envir() {
	[ ! -f .env ] || export $(grep -v '^#' .env | xargs)
}

function chpwd_do_ls() {
	l
}

chpwd_functions=(chpwd_do_ls)
