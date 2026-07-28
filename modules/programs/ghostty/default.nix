{
  pkgs,
  lib,
  ...
}: let
  # https://github.com/nix-community/home-manager/issues/6295
  ghostty-mock = pkgs.writeShellScriptBin "ghostty-mock" ''
    true
  '';
  package =
    if pkgs.stdenv.isDarwin
    then ghostty-mock
    else pkgs.ghostty;
in {
  programs.ghostty = {
    enable = true;
    inherit package;

    enableZshIntegration = true;

    settings =
      {
        shell-integration-features = "no-cursor";
        mouse-hide-while-typing = true;

        font-family = "Fira Code";
        font-family-italic = "Victor Mono";
        font-family-bold-italic = "Victor Mono";

        adjust-cell-height = 18;
        font-size = 11;

        cursor-style = "block";
        cursor-style-blink = false;
        cursor-color = "#ea9a97";

        theme = "Rose Pine Moon";

        background-opacity = 0.90;
        background-blur-radius = 60;

        window-padding-x = 20;
        window-padding-y = "20,3";
      }
      // lib.optionalAttrs pkgs.stdenv.isDarwin {
        macos-option-as-alt = true;
        macos-titlebar-style = "hidden";
      };
  };
}
