#!/usr/bin/env zsh

export POETRY_VIRTUALENVS_IN_PROJECT=1
export POETRY_VIRTUALENVS_CREATE=1

function vi() {
  if [ -e .venv/ ]; then
    . .venv/bin/activate
    nvim $*;
    deactivate;

  else
    nvim $*;

  fi
}

alias s='. .venv/bin/activate'
