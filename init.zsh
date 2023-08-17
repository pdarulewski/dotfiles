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


print_green "Installing autocompletion files"

mkdir -p $HOME/.zsh/completion

for file in **/completion.zsh(N)
do
  print_green "\nInstalling $file..."
  source $file;
done;

print_green "Done."
