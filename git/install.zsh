#!/usr/bin/env zsh

print_green "Installing git configurations."

create_link "$PWD/git/.gitconfig" ${HOME}/.gitconfig
create_link "$PWD/git/.gitignore" ${HOME}/.gitignore
