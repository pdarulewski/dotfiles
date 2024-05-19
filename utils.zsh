#!/usr/bin/env zsh

# $1 - text to print
function print_green {
	print -P "%F{green}"$1"%f"
}
