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

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    import-tree.url = "github:denful/import-tree";

    den.url = "github:denful/den";

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
    den =
      (inputs.nixpkgs.lib.evalModules {
        modules = [(inputs.import-tree ./modules)];
        specialArgs.inputs = inputs;
      }).config;

    inherit (den.den.hosts.x86_64-darwin) inazuma;
    inherit (den.den.hosts.aarch64-darwin) akari;
    inherit (den.den.hosts.x86_64-linux) nuno;
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      switch = pkgs.writeShellApplication {
        name = "switch";
        text = ''
          case "$(uname -s)-$(uname -m)" in
            Darwin-arm64)  sudo nix run nix-darwin -- switch --flake .#akari ;;
            Darwin-x86_64) sudo nix run nix-darwin -- switch --flake .#inazuma ;;
            Linux-x86_64)  sudo nixos-rebuild switch --flake .#nuno ;;
            *) echo "Unsupported platform: $(uname -s)-$(uname -m)" ;;
          esac
        '';
      };
    in {
      devShells.default = pkgs.mkShell {
        name = "dotfiles";
        packages = with pkgs; [
          alejandra
          inputs.python.legacyPackages.${system}.python312
          lua51Packages.luacheck
          luarocks
          nil
          nodejs
          stylua
          switch
        ];
      };
    })
    // {
      darwinConfigurations = {
        inazuma = nix-darwin.lib.darwinSystem {
          modules = [
            inazuma.mainModule
          ];
        };

        akari = nix-darwin.lib.darwinSystem {
          modules = [
            akari.mainModule
          ];
        };
      };

      nixosConfigurations = {
        nuno = nixpkgs.lib.nixosSystem {
          modules = [
            nuno.mainModule
          ];
        };
      };
    };
}
