{ ... }:
{
  imports = [
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
