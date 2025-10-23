{ ... }:
{
  system.primaryUser = "pd";
  system.defaults = {
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
    };

    dock = {
      autohide = true;
      orientation = "bottom";
      tilesize = 36;
    };
  };
}
