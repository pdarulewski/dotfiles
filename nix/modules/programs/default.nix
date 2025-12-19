{ pkgs, config, lib, ... }:
{
  imports = [
    ./btop
    ./codespell
    ./docker
    ./eza
    ./fzf
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
    activation.createDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p ${config.home.homeDirectory}/dev
      mkdir -p ${config.home.homeDirectory}/vaults
    '';
    packages = [
      pkgs.devenv
    ];
    username = "pd";
    stateVersion = "25.05";
    sessionVariables = {
      BOOKMARKS = "${config.home.homeDirectory}/vaults/bookmarks.txt";
      EDITOR = "nvim";
      THEME = "rose";
      VISUAL = "nvim"; # crontab editor on MacOS
    };
  };
}
