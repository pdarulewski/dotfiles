#!/usr/bin/env zsh

export KUBE_EDITOR="nvim"

alias k='kubectl'
alias kctx='kubectx'

function kns() {
	kubectl config set-context --current --namespace="$1"
}
