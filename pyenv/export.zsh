#!/usr/bin/env zsh

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
