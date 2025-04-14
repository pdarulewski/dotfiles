#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias diff='diff --side-by-side -W $(( $(tput cols) - 2 ))'

alias s='. .venv/bin/activate'

function mkd() {
  mkdir -p "$@" && cd "$_"
}

function chpwd_do_ls() {
  l
}

chpwd_functions=(chpwd_do_ls)

function v() {
  if [ -e .venv/ ]; then
    # envir
    s
    nvim $*
    deactivate

  else
    # envir
    nvim $*

  fi
}
