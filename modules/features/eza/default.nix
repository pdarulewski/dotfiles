{inputs, ...}: {
  den.aspects.eza.homeManager = {
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
      theme = "${inputs.eza-themes}/themes/rose-pine-moon.yml";
    };

    programs.zsh.shellAliases.l = "eza";

    xdg.dataFile."completions/_eza".source = "${inputs.eza}/completions/zsh/_eza";
  };
}
