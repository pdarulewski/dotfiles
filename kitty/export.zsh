#!/usr/bin/env zsh

# change kitty tab name
function change_title_bar() {
	local statusline="${PWD##*/}"
	case $TERM in
	xterm* | gnome*)
		print -Pn "\e]0;$statusline\a"
		;;
	screen* | tmux*)
		print -Pn "\ek$statusline\e\\"
		;;
	esac
}

precmd() {
	change_title_bar
}
