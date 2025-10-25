{ pkgs, lib, ... }:
let
  currentDir = builtins.path { path = ./.; };

  func = lib.mkOrder 1500 ''
    source ${currentDir}/func.zsh
  '';
in
{
  home.packages = with pkgs; [
    docker
  ];

  xdg.dataFile."completions/_docker".source = pkgs.writeShellScriptBin "_docker" ''
    ${pkgs.docker}/bin/docker completions zsh > $out
  '';

  programs.zsh = {
    initContent = lib.mkMerge [ func ];
  };
}
