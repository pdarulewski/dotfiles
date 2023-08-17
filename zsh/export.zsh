#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/pd/google-cloud-sdk/bin/:$PATH"

export KUBE_EDITOR="nvim"

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export PYTORCH_ENABLE_MPS_FALLBACK=1

# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

export EDITOR='vi'
export PROJECTS="$HOME/repo"
