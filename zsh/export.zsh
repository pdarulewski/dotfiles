#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export HISTSIZE=100000

export PATH="/usr/local/opt/ruby/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export PYTORCH_ENABLE_MPS_FALLBACK=1

# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)
