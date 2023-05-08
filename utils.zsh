#!/usr/bin/env zsh

# $1 - text to print
function print_green {
  print -P "%F{green}"$1"%f"
}

# ln -s $1 $2
function create_link {
  if [ ! -e $2 ]; then
    ln -s "$1" $2
    print_green "symlink to $2 created."
  else
    print_green "$2 exists, symlink not created."
  fi
}
