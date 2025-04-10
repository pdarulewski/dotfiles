#!/usr/bin/env zsh

export KUBE_EDITOR="nvim"

alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

function kpf() {
  kubectl port-forward $1 8080:8080
}
