#!/usr/bin/env zsh

function notify() {
	osascript -e "display notification \"$1\" with title \"$2\""
}
