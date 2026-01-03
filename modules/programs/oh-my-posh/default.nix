{...}: {
  programs.oh-my-posh = {
    enable = true;

    configFile = ./config.yaml;
    enableZshIntegration = true;
  };
}
