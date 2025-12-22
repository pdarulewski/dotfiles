{pkgs, ...}: {
  system.stateVersion = 6;
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "pd"];
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
}
