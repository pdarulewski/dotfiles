#!/usr/bin/env zsh

print_green "Installing colorls."

export PATH="/usr/local/opt/ruby/bin:$PATH"
gem install colorls

create_link $(gem env gemdir)/bin/colorls /usr/local/bin/colorls
