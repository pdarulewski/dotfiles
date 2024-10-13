{ pkgs }:

with pkgs; [
  # apps
  kitty
  neovim
  slack
  spicetify-cli
  # spotify
  tmux

  # basic tools
  bat
  btop
  fd
  fzf
  gnupg
  jq
  neofetch
  ripgrep
  tree
  wget
  zoxide
  zsh
  zsh-powerlevel10k

  # fonts
  fira-code
  nerdfonts
  victor-mono

  # git
  gh
  git
  git-lfs
  lazygit
  pre-commit

  # go
  go

  # kubernetes
  k9s
  kubectl
  kubectx
  kubernetes-helm

  # nix
  nixfmt-rfc-style

  # node
  nodejs_22

  # python
  poetry
  pyenv

  # rust
  rustup

  # ruby
  ruby
]
