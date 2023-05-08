#!/usr/bin/env zsh

print_green "Installing zsh..."

create_link "$PWD/zsh/.zshrc" ${HOME}/.zshrc

zsh_plugins_path="${HOME}/.local/share/zsh/plugins"

if [ ! -e $zsh_plugins_path/zsh-z ]; then
  git clone --depth 1 https://github.com/agkozak/zsh-z.git\
   $zsh_plugins_path/zsh-z

else
  print_green "z exists, skipping."
fi


if [ ! -e $zsh_plugins_path/zsh-autosuggestions ]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git\
   $zsh_plugins_path/zsh-autosuggestions

else
  print_green "zsh-autosuggestions exists, skipping."
fi

if [ ! -e $zsh_plugins_path/zsh-syntax-highlighting ]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git\
   $zsh_plugins_path/zsh-syntax-highlighting

else
  print_green "zsh-syntax-highlighting exists, skipping."
fi

if [ ! -e $zsh_plugins_path/zsh-fzf-history-search ]; then
  git clone --depth 1 https://github.com/joshskidmore/zsh-fzf-history-search.git\
   $zsh_plugins_path/zsh-fzf-history-search

else
  print_green "zsh-fzf-history-search exists, skipping."
fi

if [ ! -e $zsh_plugins_path/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git\
   $zsh_plugins_path/powerlevel10k

else
  print_green "powerlevel10k exists, skipping."
fi
