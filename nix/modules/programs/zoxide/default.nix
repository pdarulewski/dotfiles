{ pkgs, lib, ... }:
let
  # instead of using default enableZshIntegration with 851, delay event further
  # https://github.com/nix-community/home-manager/issues/6455
  integration = lib.mkOrder 2000 ''
    eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
  '';
in
{
  programs.zoxide = {
    enable = true;
  };

  programs.zsh = {
    initContent = lib.mkMerge [ integration ];
  };
}
