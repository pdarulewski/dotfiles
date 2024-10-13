{ config, pkgs, lib, ... }:

{
  git = import ./config/git.nix;
  zsh = import ./config/zsh.nix { pkgs = pkgs; lib = lib; config = config; };
}
