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
alias gP='git push'

alias gs='git stash'
alias gsp='git stash pop'
alias gsd='git stash drop'
