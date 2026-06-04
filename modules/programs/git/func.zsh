#!/usr/bin/env zsh

function grbi() {
  git rebase -i HEAD~$1
}

# clone "git@github.com:pdarulewski/dotfiles.git" into ~/dev/github.com/pdarulewski/dotfiles
function gc() {
  local url=$(echo $1 | cut -d "@" -f 2 | cut -d ":" -f 1)
  local org=$(echo $1 | cut -d ":" -f 2 | cut -d "/" -f 1)
  local repo=$(basename -s .git $1)
  local target="$HOME/dev/$url/$org/$repo"

  git clone --bare $1 "$target/.bare"
  echo "gitdir: ./.bare" >"$target/.git"
  git -C "$target/.bare" config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git -C "$target/.bare" fetch origin
  git -C "$target/.bare" worktree add "$target/main" main
}

function g() {
  current_dir=$(pwd)
  local repo_name=$(echo "$current_dir" | cut -d'/' -f5-7)
  open "https://$repo_name"
}

function gwa() {
  local branch=$1
  local dir=${branch//\//-}
  git worktree add -b "$dir" "$branch"
}

function gwd() {
  local branch=$1
  local dir=${branch//\//-}
  git worktree remove "$dir"
}

function gwp() {
  local branch=$1
  local dir=${branch//\//-}
  git -C "$dir" pull origin "$branch"
}
