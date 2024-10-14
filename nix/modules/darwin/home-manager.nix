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
        # file = import ../shared/files.nix { inherit config; };
        packages = pkgs.callPackage ./packages.nix {};
        stateVersion = "24.05";
      };
      programs = import ../shared/programs.nix { inherit config pkgs lib; };
      xdg = import ../shared/config/xdg.nix;
    };
  };
}

# home.nix

# copy the file `bar` to the nix store and make a link to it at ~/foo
# home.file.foo.source = ./bar

# same as above, but make a link to it at ~/.config/foo
# xdg.configFile.foo.source = ./bar

# direct symlink, an absolute path string is required if you're using flakes
# xdg.configFile.foo.source =  config.lib.file.mkOutOfStoreSymlink "/absolute/path/to/bar";
