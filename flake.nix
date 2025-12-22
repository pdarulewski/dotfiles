{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        formatter = pkgs.nixfmt-tree;
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.cargo # nix
            pkgs.luarocks # nvim
            pkgs.nodejs # npm for other lsp
          ];
        };
      }
    );
}
