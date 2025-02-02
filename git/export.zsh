#!/usr/bin/env zsh

alias ga='git add'
alias gaa='git add --all'

alias gcb='git checkout -b'
alias gco='git checkout'

alias gbd='git branch -D'

alias gst='git status'

alias gcmsg='git commit -m'

# alias grbia='git rebase -i `git merge-base feature main`'
function grbi() {
  git rebase -i HEAD~$1
}

alias grbc='git rebase --continue'

alias gl='git log --oneline --decorate --graph'

alias gp='git pull'
alias gpu='git push'
alias gpuf='git push --force-with-lease'

alias gsa='git stash --all'
alias gsp='git stash pop'
alias gsd='git stash drop'

alias gcp='git cherry-pick'

function gc() {
  # clone "git@github.com:pdarulewski/dotfiles.git" into ~/repo/github.com/pdarulewski/dotfiles
  url=$(echo $1 | cut -d "@" -f 2 | cut -d ":" -f 1)
  org=$(echo $1 | cut -d ":" -f 2 | cut -d "/" -f 1)
  repo=$(basename -s .git $1)

  git clone $1 $HOME/repo/$url/$org/$repo

  if [ ! -d $HOME/.config/git ]; then
    mkdir $HOME/.config/git
  fi
  if [ ! -f $HOME/.config/git/maintenance ]; then
    touch $HOME/.config/git/maintenance
    echo "[maintenance]\n\tauto = false\n\tstrategy = incremental" >>$HOME/.config/git/maintenance
  fi

  echo "\trepo = $HOME/repo/$org/$repo" >>$HOME/.config/git/maintenance
}

function g() {
  current_dir=$(pwd)
  local repo_name=$(echo "$current_dir" | cut -d'/' -f5-7)
  open "https://$repo_name"
}
