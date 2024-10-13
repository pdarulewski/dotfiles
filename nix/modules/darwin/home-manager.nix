{ config, pkgs, lib, home-manager, ... }:


let
  user = "pd";
in
{
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        stateVersion = "24.05";
      };
      xdg = import ../shared/config/xdg.nix;
      programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };

    };
  };
}
