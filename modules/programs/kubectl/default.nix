{
  pkgs,
  lib,
  ...
}: let
  currentDir = builtins.path {path = ./.;};

  functions = lib.mkOrder 1500 ''
    source ${currentDir}/func.zsh
  '';
in {
  home.packages = with pkgs; [
    kubectl
  ];

  xdg.dataFile."completions/_kubectl".source = pkgs.writeShellScriptBin "_kubectl" ''
    ${pkgs.docker}/bin/kubectl completions zsh > $out
  '';

  programs.zsh = {
    initContent = lib.mkMerge [
      functions
      ''
        export KUBE_EDITOR='nvim'
      ''
    ];

    shellAliases = {
      k = "kubectl";
      kctx = "kubectx";
      kns = "kubens";
    };
  };
}
