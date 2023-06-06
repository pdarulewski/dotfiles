source $HOME/.config/zsh/export.zsh
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/plugin.zsh

export PATH=$PATH:/Users/pd/.spicetify

for file in ${HOME}/.config/**/autocomplete.zsh(N)
do
  source $file;
done;

if [ -e $HOME/.config/zsh/custom.zsh ]; then
  source $HOME/.config/zsh/custom.zsh
fi

setopt share_history
