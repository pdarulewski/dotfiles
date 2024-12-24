#!/usr/bin/env zsh

print_green "Installing colorls."

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
gem install colorls

ln -s $(gem env gemdir)/bin/colorls $XDG_BIN_HOME/colorls
