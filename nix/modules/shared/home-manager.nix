{ config, pkgs, lib, ... }:

{
  git = import ./config/git.nix;
  kitty = import ./config/kitty.nix;
  tmux = import ./config/tmux.nix { pkgs = pkgs; };
  zsh = import ./config/zsh.nix { pkgs = pkgs; lib = lib; config = config; };
}
