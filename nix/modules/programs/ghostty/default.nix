{ pkgs, ... }:
let
  # https://github.com/nix-community/home-manager/issues/6295
  ghostty-mock = pkgs.writeShellScriptBin "gostty-mock" ''
    true
  '';
in
{
  programs.ghostty = {
    enable = true;
    package = ghostty-mock;

    enableZshIntegration = true;

    settings = {
      shell-integration-features = "no-cursor";
      mouse-hide-while-typing = true;
      macos-option-as-alt = true;

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

      macos-titlebar-style = "hidden";

      window-padding-x = 20;
      window-padding-y = "20,3";
    };
  };
}
