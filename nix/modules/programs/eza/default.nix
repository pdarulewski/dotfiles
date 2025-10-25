{ ... }:
{
  xdg.configFile."eza/theme.yaml".source = ./theme.yaml;

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
  };

  programs.zsh.shellAliases = {
    l = "eza";
  };
}
