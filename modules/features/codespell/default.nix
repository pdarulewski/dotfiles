{...}: {
  den.aspects.codespell.homeManager = {pkgs, ...}: {
    xdg.configFile."codespell/setup.cfg".source = ./setup.cfg;
  };
}
