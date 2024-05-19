#!/usr/bin/env zsh

ZSH_COMPDUMP_DIR="$ZSH_CACHE"/zcompcache
[[ -d $ZSH_COMPDUMP_DIR ]] || mkdir -p $ZSH_COMPDUMP_DIR
ZCOMPCACHE="$ZSH_COMPDUMP_DIR/.zcompdump-${ZSH_VERSION}"

autoload -Uz compinit && compinit -C -d $ZSH_COMPDUMP_DIR

zstyle ':completion:*' cache-path $ZCOMPCACHE
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' file-list all
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

fpath+=$ZSH_COMPLETIONS
