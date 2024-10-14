{ config, pkgs, lib, ... }:

{
  git = import ./config/git.nix;
  kitty = import ./config/kitty.nix;
  zsh = import ./config/zsh.nix { pkgs = pkgs; lib = lib; config = config; };
}
