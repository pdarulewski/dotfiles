{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    settings.experimental-features = "nix-command flakes";
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      # cudaSupport = true;
      # cudaCapabilities = ["8.0"];
      # allowBroken = true;
      # allowInsecure = false;
      # allowUnsupportedSystem = true;
    };
  };
}
