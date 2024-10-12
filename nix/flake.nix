{
  description = "Darwin intel system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
          bat
          btop
          fd
          fira-code
          fzf
          gh
          git
          git-lfs
          gnupg
          go
          jq
          k9s
          kitty
          kubectl
          kubectx
          kubernetes-helm
          lazygit
          mkalias # create aliases for apps in Applications
          neofetch
          neovim
          nerdfonts
          nodejs_22
          poetry
          zsh-powerlevel10k
          pre-commit
          pyenv
          rectangle
          ripgrep
          ruby
          rustup
          spicetify-cli
          # spotify
          tmux
          tree
          victor-mono
          wget
          wget
          zsh
        ];

      system.activationScripts.applications.text = let
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

      system.defaults = {
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.InitialKeyRepeat = 1;
        NSGlobalDomain.KeyRepeat = 2;
        NSGlobalDomain._HIHideMenuBar = true;
        dock.autohide = true;
        dock.autohide-delay = 0.1;
        dock.autohide-time-modifier = 0.5;
        dock.magnification = false;
        dock.minimize-to-application = true;
        dock.persistent-apps = [];
        dock.show-recents = false;
        dock.tilesize = 32;
        finder.AppleShowAllExtensions = true;
        finder.AppleShowAllFiles = true;
        finder.FXPreferredViewStyle = "clmv";
        finder._FXSortFoldersFirst = true;
        loginwindow.GuestEnabled = false;
        screencapture.location = "clipboard";
        trackpad.Clicking = true;
        trackpad.TrackpadThreeFingerDrag = true;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#pd-macos-intel
    darwinConfigurations."pd-macos-intel" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."pd-macos-intel".pkgs;
  };
}
