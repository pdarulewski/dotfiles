#!/usr/bin/env zsh

export POETRY_VIRTUALENVS_IN_PROJECT=1
export POETRY_VIRTUALENVS_CREATE=1

alias s='. .venv/bin/activate'

function vi() {
	if [ -e .venv/ ]; then
		envir
		s
		nvim $*
		deactivate

	else
		envir
		nvim $*

	fi
}
