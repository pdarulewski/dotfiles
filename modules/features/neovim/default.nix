{inputs, ...}: {
  den.aspects.neovim.homeManager = {config, ...}: let
    # Live editing (requires rebuild only when switching modes):
    # nvimDir = "${config.home.homeDirectory}/dev/github.com/pdarulewski/dotfiles/main/home/programs/neovim/nvim";
    nvimDir = "${inputs.self}/modules/features/neovim/nvim";
  in {
    programs.neovim = {
      enable = true;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      initLua = builtins.readFile ./nvim/init.lua;
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      THEME = "rose";
      VISUAL = "nvim"; # crontab editor on macOS
    };

    xdg.configFile."nvim/dashboard.jpg".source = ./dashboard.jpg;

    xdg.configFile."nvim/lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/lua";
      force = true;
    };

    xdg.configFile."nvim/after" = {
      source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/after";
      force = true;
    };

    xdg.configFile."nvim/queries" = {
      source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/queries";
      force = true;
    };

    xdg.configFile."nvim/lazy-lock.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/lazy-lock.json";
      force = true;
    };
  };
}
