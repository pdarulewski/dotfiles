#!/usr/bin/env zsh

# crontab editor on MacOS
export VISUAL='nvim'

export HOSTALIASES=$HOME/.hosts

export PATH=$PATH:$HOME/bin

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
