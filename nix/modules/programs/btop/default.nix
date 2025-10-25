{ themes, ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "catppuccin_macchiato";
      theme_background = false;
    };
  };

  xdg.configFile."btop/themes".source = "${themes.btop}/themes";
}
