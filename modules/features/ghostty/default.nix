{...}: {
  den.aspects.ghostty.homeManager = {pkgs, ...}: let
    # https://github.com/nix-community/home-manager/issues/6295
    ghostty-mock = pkgs.writeShellScriptBin "ghostty-mock" ''
      true
    '';
  in {
    programs.ghostty = {
      enable = true;
      package = ghostty-mock;

      enableZshIntegration = true;

      settings = {
        shell-integration-features = "no-cursor";
        mouse-hide-while-typing = true;
        macos-option-as-alt = true;

        font-family = "Iosevka NFM";
        font-family-italic = "Victor Mono";
        font-family-bold-italic = "Victor Mono";

        adjust-cell-height = 20;
        adjust-cell-width = "5%";
        font-size = 12;

        cursor-style = "block";
        cursor-style-blink = false;
        cursor-color = "#ea9a97";

        theme = "Rose Pine";

        background-opacity = 0.90;
        background-blur-radius = 60;

        macos-titlebar-style = "hidden";

        window-padding-x = 20;
        window-padding-y = "20,3";
      };
    };
  };
}
