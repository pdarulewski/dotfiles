{ pkgs, lib, ... }:
let
  currentDir = builtins.path { path = ./.; };

  functions = lib.mkOrder 1500 ''
    source ${currentDir}/func.zsh
  '';
in
{
  home.packages = with pkgs; [
    kubectl
  ];

  xdg.dataFile."completions/_gh".source = pkgs.writeShellScriptBin "_gh" ''
    ${pkgs.docker}/bin/gh completions -s zsh > $out
  '';

  programs.gh = {
    enable = true;

    hosts = {
      "github.com" = {
        user = "pdarulewski";
        git_protocol = "ssh";
      };
    };
  };

  programs.zsh = {
    initContent = lib.mkMerge [
      functions
    ];
  };
}
