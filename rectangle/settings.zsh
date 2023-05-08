#!/usr/bin/env zsh

print_green "Setting up Rectangle."

defaults write com.knollsoft.Rectangle gapSize -int 15

killall Rectangle
open -a Rectangle
