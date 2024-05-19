#!/usr/bin/env zsh

print_green "Installing colorls."

gem install --user-install colorls

ln -s $(gem env gemdir)/bin/colorls $XDG_BIN_HOME/colorls
