#!/usr/bin/env zsh

function kpf() {
  if [ -z "$1" ]; then
    echo "Usage: kpf <pod-name>"
    return 1
  fi

  kubectl port-forward "$1" 8080:8080
}
