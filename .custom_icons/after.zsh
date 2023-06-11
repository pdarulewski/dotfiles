#!/usr/bin/env zsh

set_icon() {
	cp $1 $2/Contents/Resources/$1
	touch $2
}

set_icon kitty.icns /Applications/kitty.app

sudo killall Finder && sudo killall Finder
