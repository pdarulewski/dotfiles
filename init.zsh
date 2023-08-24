#!/usr/bin/env zsh

source utils.zsh

print_green "Initialisation of dotfiles."

create_link $PWD "$HOME/.config"


print_green "Installing before.zsh files"
for file in **/before.zsh(.)
do
  print_green "\nSourcing $file..."
  source $file;
done;


print_green "Installing install.zsh files"
for file in **/install.zsh(.)
do
  print_green "\nSourcing $file..."
  source $file;
done;


print_green "Applying after.zsh files"
for file in **/after.zsh(.)
do
  print_green "\nApplying $file..."
  source $file;
done;


print_green "Installing nvim."
packer_path="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [ ! -e $packer_path ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   $packer_path
else
  print_green "packer.nvim exists, skipping."
fi

print_green "Done."
