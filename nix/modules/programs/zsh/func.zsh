#!/usr/bin/env zsh

function envir() {
  [ ! -f .env ] || export $(grep -v '^#' .env | xargs)
}

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

function bk() {
  if [[ -n "$1" ]]; then
    echo "$1" >>$bookmarks_file
  else
    local selected_line selected_url
    selected_line=$(cat $bookmarks_file | fzf)

    if [[ -n "$selected_line" ]]; then
      selected_url=$(echo "$selected_line" | awk '{print $1}')
      open "$selected_url"
    fi
  fi
}
