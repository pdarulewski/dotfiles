{ config, pkgs, lib, ... }:

{
  git = import ./config/git.nix;
  kitty = import ./config/kitty.nix;
  tmux = import ./config/tmux.nix { inherit pkgs; };
  zsh = import ./config/zsh.nix { inherit pkgs lib config; };
}
