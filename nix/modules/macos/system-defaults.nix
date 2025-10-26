{ ... }:
{
  system.primaryUser = "pd";
  system = {
    defaults = {
      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = true;
        "com.apple.mouse.tapBehavior" = 1;

        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
      };

      controlcenter = {
        BatteryShowPercentage = true;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.2;
        largesize = 18;
        magnification = true;
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "bottom";
        persistent-apps = [];
        show-recents = false;
        static-only = true;
        tilesize = 15;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
      };

      screencapture = {
        location = "$HOME/screenshots";
        disable-shadow = true;
      };

      screensaver = {
        askForPassword = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
