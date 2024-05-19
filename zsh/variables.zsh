#!/usr/bin/env zsh

export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
export ZSH_COMPLETIONS=$ZSH_CACHE/completions

# doesn't work on macos
export HOSTALIASES=$HOME/.hosts

# FIXME: this is a mess
export PATH=$PATH:$HOME/.gem/ruby/3.3.0/bin
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export PATH="/Users/pd/google-cloud-sdk/bin/:$PATH"

# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

# crontab editor on MacOS
export VISUAL='nvim'

export EDITOR='nvim'

export THEME="ocean"
