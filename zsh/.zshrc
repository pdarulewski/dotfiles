if [ -n "${ZSH_DEBUGRC+1}" ]; then
	zmodload zsh/zprof
fi

source "$HOME"/.config/xdg/pre.zsh

source "$HOME"/.config/zsh/variables.zsh
source "$HOME"/.config/zinit/pre.zsh

source "$HOME"/.config/zsh/completion.zsh
source "$HOME"/.config/zsh/history.zsh

for file in $HOME/.config/zsh/scripts/*.zsh(.)
do
  source $file;
done;

for file in $HOME/.config/**/export.zsh(.)
do
  source $file;
done;

source $HOME/.config/powerlevel10k/.p10k.zsh

# time ZSH_DEBUGRC=1 zsh -i -c exit
if [ -n "${ZSH_DEBUGRC+1}" ]; then
	zprof
fi

source "$HOME"/.config/_personal/export.zsh
