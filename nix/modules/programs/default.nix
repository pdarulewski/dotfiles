{ pkgs, config, lib, ... }:
{
  imports = [
    ./btop
    ./codespell
    ./docker
    ./eza
    ./gh
    ./gh-dash
    ./ghostty
    ./git
    ./k9s
    ./kubectl
    ./lazydocker
    ./lazygit
    ./neovim
    ./oh-my-posh
    ./ripgrep
    ./tmux
    ./zoxide
    ./zsh
  ];

  xdg.enable = true;

  home = {
    activation.createReposDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p ${config.home.homeDirectory}/repo
      mkdir -p ${config.home.homeDirectory}/vault
    '';
    packages = [
      pkgs.devenv
    ];
    username = "pd";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
