{...}: {
  den.aspects.docker.homeManager = {
    pkgs,
    lib,
    ...
  }: {
    xdg.dataFile."completions/_docker".source = pkgs.runCommand "_docker" {} ''
      ${pkgs.docker}/bin/docker completion zsh > $out
    '';

    programs.zsh.initContent = lib.mkOrder 1500 ''
      source ${./func.zsh}
    '';
  };
}
