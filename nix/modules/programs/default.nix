{ ... }:
{
  imports = [
    ./btop
    ./codespell
    ./eza
    ./ghostty
    ./git
    ./k9s
    ./lazygit
    ./oh-my-posh
    ./zsh.nix
  ];

  xdg.enable = true;

  home = {
    username = "pd";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
