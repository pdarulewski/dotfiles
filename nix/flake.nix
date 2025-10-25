{
  description = "pd system flake (macOS Intel, Apple Silicon, and future Arch)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin-btop = { url = "github:catppuccin/btop"; flake = false; };
    k9s = { url = "github:derailed/k9s"; flake = false; };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    themes = {
      btop = inputs.catppuccin-btop;
      k9s  = inputs.k9s;
    };

    mkDarwinSystem = name: arch: modules: nix-darwin.lib.darwinSystem {
      system = arch;
      specialArgs = { inherit inputs themes; };
      modules = modules;
    };

  in {
    darwinConfigurations = {
      "pd-macos-intel" = mkDarwinSystem "pd-macos-intel" "x86_64-darwin" [
        ./hosts/macos-intel/configuration.nix

        ./modules/macos/system-defaults.nix
        ./modules/macos/home-manager.nix
        ./modules/macos/homebrew.nix
        ./modules/macos/users.nix
      ];

      "pd-macos-apple" = mkDarwinSystem "pd-macos-apple" "aarch64-darwin" [
        ./hosts/macos-apple/configuration.nix

        ./modules/macos/system-defaults.nix
        ./modules/macos/home-manager.nix
        ./modules/macos/homebrew.nix
        ./modules/macos/users.nix
      ];
    };
  };
}
