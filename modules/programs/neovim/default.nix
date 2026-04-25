{config, ...}: let
  nvimDir = "${config.home.homeDirectory}/dev/github.com/pdarulewski/dotfiles/modules/programs/neovim/nvim";
in {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    initLua = builtins.readFile ./nvim/init.lua;
  };

  xdg.configFile."nvim/lua" = { source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/lua"; force = true; };
  xdg.configFile."nvim/after" = { source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/after"; force = true; };
  xdg.configFile."nvim/queries" = { source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/queries"; force = true; };
  xdg.configFile."nvim/lazy-lock.json" = { source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}/lazy-lock.json"; force = true; };
}
