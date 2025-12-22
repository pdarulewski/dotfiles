{
  description = "pd system flake (macOS Intel, Apple Silicon, and future Arch)";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eza = {
      url = "github:eza-community/eza";
      flake = false;
    };

    eza-themes = {
      url = "github:eza-community/eza-themes";
      flake = false;
    };

    rose-pine-btop = {
      url = "github:rose-pine/btop";
      flake = false;
    };

    k9s = {
      url = "github:derailed/k9s";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  }: let
    completions = {
      eza = inputs.eza;
    };

    themes = {
      btop = inputs.rose-pine-btop;
      eza = inputs.eza-themes;
      k9s = inputs.k9s;
    };

    mkDarwinSystem = name: arch: modules:
      nix-darwin.lib.darwinSystem {
        system = arch;
        specialArgs = {inherit inputs completions themes;};
        modules = modules;
      };
  in {
    darwinConfigurations = {
      "pd-macos-intel" = mkDarwinSystem "pd-macos-intel" "x86_64-darwin" [
        ./hosts/macos-intel/configuration.nix

        ./modules/macos/system-defaults.nix
        ./modules/macos/home-manager.nix
        ./modules/macos/homebrew.nix
        ./modules/macos/programs.nix
        ./modules/macos/users.nix
      ];

      "pd-macos-apple" = mkDarwinSystem "pd-macos-apple" "aarch64-darwin" [
        ./hosts/macos-apple/configuration.nix

        ./modules/macos/system-defaults.nix
        ./modules/macos/home-manager.nix
        ./modules/macos/homebrew.nix
        ./modules/macos/programs.nix
        ./modules/macos/users.nix
      ];
    };
  };
}
