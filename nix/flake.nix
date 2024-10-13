{
  description = "pd system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    {
      system.configurationRevision = self.rev or self.dirtyRev or null;
      darwinConfigurations."pd-macos-intel" = nix-darwin.lib.darwinSystem {
        modules = [
            home-manager.darwinModules.home-manager
            ./hosts/darwin
        ];
      };
      darwinPackages = self.darwinConfigurations."pd-macos-intel".pkgs;
    };
}
