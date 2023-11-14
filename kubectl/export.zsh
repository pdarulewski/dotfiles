#!/usr/bin/env zsh

alias k='kubectl'
alias kctx='kubectx'

function kns() {
    kubectl config set-context --current --namespace="$1"
}
