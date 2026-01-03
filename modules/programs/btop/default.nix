{themes, ...}: {
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "rose-pine-moon";
      theme_background = false;
    };
  };

  xdg.configFile."btop/themes".source = "${themes.btop}/themes";
}
