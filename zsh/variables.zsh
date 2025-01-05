#!/usr/bin/env zsh

export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
export ZSH_COMPLETIONS=$ZSH_CACHE/completions

# doesn't work on macos
# export HOSTALIASES=$HOME/.hosts

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export PATH="/Users/pd/google-cloud-sdk/bin/:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

# crontab editor on MacOS
export VISUAL='nvim'

export EDITOR='nvim'

# export THEME="ocean"
export THEME="rose"
