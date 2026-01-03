#!/usr/bin/env zsh

function pr() {
  current_dir=$(pwd)
  local repo_name=$(echo "$current_dir" | cut -d'/' -f5-7)
  if [ -z "$1" ]; then
    open "https://$repo_name/pulls"
  else
    open "https://$repo_name/pull/$1"
  fi
}

function ghpr() {
  if [ -z "$1" ]; then
    gh pr create
  else
    gh pr create --base $1
  fi
}
