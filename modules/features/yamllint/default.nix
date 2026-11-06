{...}: {
  den.aspects.yamllint.homeManager = {
    xdg.configFile."yamllint/config".source = ./.yamllint.yaml;
  };
}
