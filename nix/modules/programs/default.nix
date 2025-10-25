{ ... }:
{
  imports = [
    ./btop
    ./codespell
    ./eza
    ./oh-my-posh
    ./zsh.nix
  ];

  home = {
    username = "pd";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
