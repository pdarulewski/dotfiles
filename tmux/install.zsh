#!/usr/bin/env zsh

chmod +x "$PWD/tmux/sessionizer"
chmod +x "$PWD/tmux/todo"

git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm.git
