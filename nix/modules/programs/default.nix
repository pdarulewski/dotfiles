{ ... }:
{
  imports = [
    ./btop
    ./codespell
    ./eza
    ./git
    ./k9s
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
