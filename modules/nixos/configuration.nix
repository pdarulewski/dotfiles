{pkgs, ...}: {
  den.aspects.configuration = {
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Networking
    networking.networkmanager.enable = true;

    # Time zone and internationalisation
    time.timeZone = "Europe/Copenhagen";
    i18n.defaultLocale = "en_US.UTF-8";

    # Sound with PipeWire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # SSH daemon
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    # Allow unfree packages and share nixpkgs with Home Manager
    nixpkgs.config.allowUnfree = true;
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    # System packages
    environment.systemPackages = with pkgs; [
      git
      vim
      curl
    ];
  };
}
