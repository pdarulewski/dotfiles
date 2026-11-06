{inputs, ...}: {
  den.aspects.btop.homeManager = {
    programs.btop = {
      enable = true;

      settings = {
        color_theme = "rose-pine-moon";
        theme_background = false;
      };
    };

    xdg.configFile."btop/themes".source = "${inputs.rose-pine-btop}/themes";
  };
}
