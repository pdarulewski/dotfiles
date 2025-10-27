#!/usr/bin/env zsh

function grbi() {
  git rebase -i HEAD~$1
}

# clone "git@github.com:pdarulewski/dotfiles.git" into ~/dev/github.com/pdarulewski/dotfiles
function gc() {
  url=$(echo $1 | cut -d "@" -f 2 | cut -d ":" -f 1)
  org=$(echo $1 | cut -d ":" -f 2 | cut -d "/" -f 1)
  repo=$(basename -s .git $1)

  git clone $1 $HOME/dev/$url/$org/$repo
}

function g() {
  current_dir=$(pwd)
  local repo_name=$(echo "$current_dir" | cut -d'/' -f5-7)
  open "https://$repo_name"
}
