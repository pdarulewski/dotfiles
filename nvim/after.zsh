#!/usr/bin/env zsh

print_green "Installing nvim."

packer_path="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [ ! -e $packer_path ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   $packer_path
else
  print_green "packer.nvim exists, skipping."
fi
