{
  inputs,
  completions,
  themes,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs completions themes;};

    useGlobalPkgs = true;
    useUserPackages = true;
    users.pd = {
      imports = [
        ../programs
      ];
    };
    verbose = true;
  };
}
