{...}: {
  den.aspects.kubectl.homeManager = {
    lib,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      kubectl
    ];

    xdg.dataFile."completions/_kubectl".source = pkgs.writeShellScriptBin "_kubectl" ''
      ${pkgs.docker}/bin/kubectl completions zsh > $out
    '';

    programs.zsh = {
      initContent = lib.mkOrder 1500 ''
        source ${./func.zsh}
        export KUBE_EDITOR='nvim'
      '';

      shellAliases = {
        k = "kubectl";
        kctx = "kubectx";
        kns = "kubens";
      };
    };
  };
}
