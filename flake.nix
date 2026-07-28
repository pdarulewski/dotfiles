{
  description = "pd system flake (macOS Intel, Apple Silicon, Ubuntu)";

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

    flake-utils = {
      url = "github:numtide/flake-utils";
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

    python.url = "github:nixos/nixpkgs/ee09932cedcef15aaf476f9343d1dea2cb77e261";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    flake-utils,
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

    mkHomeSystem = arch: modules:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${arch};
        extraSpecialArgs = {inherit inputs completions themes;};
        modules = modules;
      };
  in
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default = nixpkgs.legacyPackages.${system}.mkShell {
        name = "dotfiles";
        packages = with nixpkgs.legacyPackages.${system}; [
          alejandra
          inputs.python.legacyPackages.${system}.python312
          lua51Packages.luacheck
          luarocks
          nil
          nodejs
          stylua
        ];
        shellHook = ''
          update_all() { nix flake update; }

          apply() {
            case "$(uname -s)-$(uname -m)" in
              Darwin-arm64)  sudo nix run nix-darwin -- switch --flake .#pd-macos-apple ;;
              Darwin-x86_64) sudo nix run nix-darwin -- switch --flake .#pd-macos-intel ;;
              Linux-x86_64)  nix run 'github:nix-community/home-manager' -- switch --flake .#pd-ubuntu ;;
              *) echo "Unsupported platform: $(uname -s)-$(uname -m)" ;;
            esac
          }
        '';
      };
    })
    // {
      homeConfigurations = {
        "pd-ubuntu" = mkHomeSystem "x86_64-linux" [
          ./hosts/ubuntu/configuration.nix

          ./modules/linux/programs.nix
          ./modules/programs
        ];
      };

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
