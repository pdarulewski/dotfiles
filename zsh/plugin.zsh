#!/usr/bin/env zsh

zsh_plugins_path="$HOME/.zsh/plugins"

source $zsh_plugins_path/zsh-z/zsh-z.plugin.zsh
source $zsh_plugins_path/zsh-autosuggestions/zsh-autosuggestions.zsh
source $zsh_plugins_path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $zsh_plugins_path/zsh-fzf-history-search/zsh-fzf-history-search.zsh

source $zsh_plugins_path/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.config/powerlevel10k/.p10k.zsh
