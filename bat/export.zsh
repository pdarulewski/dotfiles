#!/usr/bin/env zsh

function bat_fzf() {
  fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
}
alias f=bat_fzf

function bat_tail() {
  tail -f $1 | bat --paging=never -l log
}
# alias tail=bat_tail

function bat_head() {
  head -n $1 | bat --paging=never -l log
}
# alias head=bat_head

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

function batdiff() {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"
