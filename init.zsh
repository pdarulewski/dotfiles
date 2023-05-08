#!/usr/bin/env zsh

source utils.zsh

print_green "Initialisation of dotfiles."

source git/install.sh
create_link $PWD "${HOME}/.config"

print_green "Installing install.zsh files"
for file in **/install.zsh(.)
do
  print_green "Sourcing $file..."
  source $file;
done;


print_green "Applying settings.zsh files"
for file in **/settings.zsh(.)
do
  print_green "Applying $file..."
  source $file;
done;
