{...}: {
  den.aspects.eza.homeManager = {
    lib,
    pkgs,
    ...
  }: let
    eza-themes = pkgs.fetchFromGitHub {
      owner = "eza-community";
      repo = "eza-themes";
      rev = "21184b55bfe34e8473c8160f9de0c03e4f76857f";
      hash = "sha256-53J0plgB+d6b4LzSwrCezmIhfVm7WZrKMA1ORGdUtQU=";
    };

    eza = pkgs.fetchFromGitHub {
      owner = "eza-community";
      repo = "eza";
      rev = "98442ab17c2c3738701b62a7e060b1431ae2d6ea";
      hash = "sha256-4XgPePl90mnQxmTUJfOvIsCcTRSYNBuRUNOb/3kmO1k=";
    };
  in {
    programs.eza = {
      enable = true;
      enableZshIntegration = false;
      extraOptions = [
        "-algU"
        "--changed"
        "--git"
        "--group-directories-first"
        "--icons=always"
        "--no-filesize"
      ];
    };

    programs.zsh.shellAliases.l = "eza";

    xdg.configFile."eza/theme.yml".source = "${eza-themes}/themes/rose-pine-moon.yml";
    xdg.dataFile."completions/_eza".source = "${eza}/completions/zsh/_eza";
  };
}
