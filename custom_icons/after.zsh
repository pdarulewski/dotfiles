#!/usr/bin/env zsh

set_icon() {
	sudo cp custom_icons/$1 $2/Contents/Resources/$1
}

set_icon kitty.icns /Applications/kitty.app

sudo killall Finder && sudo killall Finder
