{den, ...}: {
  den.hosts.aarch64-darwin.akari.users.pd = {};

  den.aspects.akari = {
    includes = [
      den.batteries.hostname

      den.aspects.darwin
      den.aspects.fonts
    ];

    darwin = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        curl
        git
        vim
      ];

      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  };
}
