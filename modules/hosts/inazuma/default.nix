{den, ...}: {
  den.hosts.x86_64-darwin.inazuma.users.pd = {};

  den.aspects.inazuma = {
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

      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  };
}
