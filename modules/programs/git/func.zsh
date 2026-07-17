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

_git_branch_complete() {
  local expl
  local -a branches
  branches=(${(f)"$(git branch --all --format='%(refname:short)' 2>/dev/null)"})
  _wanted branches expl 'branch' compadd -a branches
}
compdef _git_branch_complete gwo gwb

function _is_bare_worktree() {
  local common_dir
  common_dir=$(git rev-parse --git-common-dir 2>/dev/null) || return 1
  [[ "$(basename "$common_dir")" == ".bare" ]]
}

function gwb() {
  local branch=$1
  local dir=${branch//\//-}
  git worktree add -b "$branch" "$dir"
  cd "$dir"
}

function gwo() {
  local branch=$1
  local dir=${branch//\//-}
  git worktree add "$dir" "$branch"
}

function gwd() {
  local branch=$1
  local dir=${branch//\//-}
  git worktree remove --force "$dir"
}

function gco() {
  if _is_bare_worktree; then
    gwo "$@"
  else
    git checkout "$@"
  fi
}

function gcb() {
  if _is_bare_worktree; then
    gwb "$@"
  else
    git checkout -b "$@"
  fi
}

function gbd() {
  if _is_bare_worktree; then
    gwd "$@"
  fi

  git branch -D "$@"
}

function gwp() {
  local branch=$1
  local dir=${branch//\//-}
  git -C "$dir" pull origin "$branch"
}
