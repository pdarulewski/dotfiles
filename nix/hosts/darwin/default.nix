{ config, pkgs, ... }:

{
  imports = [
    ../darwin/intel.nix
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
  ];

  environment.systemPackages = [] ++ (import ../../modules/darwin/packages.nix { inherit pkgs; });

  system = {
    activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.1;
        autohide-time-modifier = 0.5;
        magnification = false;
        minimize-to-application = true;
        persistent-apps = [];
        show-recents = false;
        tilesize = 32;
      };

      finder = {
        AppleShowAllFiles = true;
        FXPreferredViewStyle = "clmv";
        _FXSortFoldersFirst = true;
      };

      loginwindow = {
        GuestEnabled = false;
      };

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15; # 120, 94, 68, 35, 25, 15
        KeyRepeat = 2; # 120, 90, 60, 30, 12, 6, 2
        _HIHideMenuBar = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    stateVersion = 5;
  };
}
