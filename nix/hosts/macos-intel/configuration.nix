{ pkgs, ... }:
{
  system.stateVersion = 6;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  nixpkgs.hostPlatform = "x86_64-darwin";
}
