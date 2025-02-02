#!/usr/bin/env zsh

print_green "Installing Homebrew."
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew bundle install --file="$HOME/.config/brew/brewfile"
