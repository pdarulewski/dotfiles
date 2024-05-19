#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_BIN_HOME="$HOME/.local/bin"

export PATH=$XDG_BIN_HOME:$PATH
