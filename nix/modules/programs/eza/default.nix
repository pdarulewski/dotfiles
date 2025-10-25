{ themes, ... }:
{
  programs.eza = {
    enable = true;

    enableZshIntegration = true;
    extraOptions = [
      "-algU"
      "--changed"
      "--git"
      "--group-directories-first"
      "--icons=always"
      "--total-size"
    ];

    theme = "${themes.eza}/themes/rose-pine-moon.yml";
  };

  programs.zsh.shellAliases = {
    l = "eza";
  };
}
