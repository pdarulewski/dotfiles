{...}: {
  den.aspects.btop.homeManager = {
    lib,
    pkgs,
    ...
  }: let
    rose-pine-btop = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "btop";
      rev = "c27e5d48e44e8bd115a2838ecf8cf1f3ea39475e";
      hash = "sha256-vtqqMEQbPOSRfQ28RIln5zZ4cZlyB3sMc2NaLUcITWo=";
    };
  in {
    programs.btop = {
      enable = true;

      settings = {
        color_theme = "rose-pine-moon";
        theme_background = false;
      };
    };

    xdg.configFile."btop/themes/rose-pine-moon.theme".source = "${rose-pine-btop}/rose-pine-moon.theme";
  };
}
