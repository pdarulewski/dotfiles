#!/usr/bin/env zsh

export KUBE_EDITOR="nvim"

alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

function kpf() {
  if [ -z "$1" ]; then
    echo "Usage: kpf <pod-name>"
    return 1
  fi

  kubectl port-forward "$1" 8080:8080
}
