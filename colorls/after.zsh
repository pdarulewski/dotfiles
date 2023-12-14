#!/usr/bin/env zsh

print_green "Installing colorls."

gem install colorls

create_link $(gem env gemdir)/bin/colorls /Users/pd/bin/colorls
