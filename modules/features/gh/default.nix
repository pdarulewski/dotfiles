{...}: {
  den.aspects.gh.homeManager = {
    lib,
    pkgs,
    ...
  }: {
    xdg.dataFile."completions/_gh".source = pkgs.writeShellScriptBin "_gh" ''
      ${pkgs.gh}/bin/gh completions -s zsh > $out
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

    programs.zsh.initContent = lib.mkOrder 1500 ''
      source ${./func.zsh}
    '';
  };
}
