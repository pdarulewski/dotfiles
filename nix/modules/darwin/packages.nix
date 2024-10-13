{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
[
  mkalias # create aliases for apps in Applications
  rectangle
] ++ shared-packages
