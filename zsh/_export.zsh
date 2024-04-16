#!/usr/bin/env zsh

export THEME="ocean"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/Users/pd/google-cloud-sdk/bin/:$PATH"

# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

export EDITOR='vi'
export PROJECTS="$HOME/repo"

# change kitty tab name
function change_title_bar () {
	local statusline="${PWD##*/}"
	case $TERM in
		xterm*|gnome*)
	    		print -Pn "\e]0;$statusline\a";;
		screen*|tmux*)
	    		print -Pn "\ek$statusline\e\\";;
	esac
}

precmd () {
    change_title_bar
}


for file in $HOME/.config/zsh/scripts/*.zsh(.)
do
  source $file;
done;


for file in $HOME/.config/**/export.zsh(.)
do
  source $file;
done;
