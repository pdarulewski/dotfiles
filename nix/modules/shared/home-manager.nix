{ config, pkgs, lib, ... }:

{
  git = import ./config/git.nix;
  home-manager.enable = true;
}
