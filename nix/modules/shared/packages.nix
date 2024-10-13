{ pkgs }:

with pkgs; [
  # gui
  kitty
  slack
  # spotify

  # terminal
  bat
  btop
  colorls
  fd
  fzf
  gnupg
  jq
  neofetch
  neovim
  ripgrep
  spicetify-cli
  tmux
  tree
  wget
  zoxide
  zplug
  zsh

  # fonts
  fira-code
  nerdfonts
  (pkgs.nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
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
]
