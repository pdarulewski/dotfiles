{ completions, themes, ... }:
{
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

    theme = "${themes.eza}/themes/rose-pine-moon.yml";
  };

  programs.zsh = {
    shellAliases = {
      l = "eza";
    };
  };

  xdg.dataFile."completions/_eza".source = "${completions.eza}/completions/zsh/_eza";
}
