{
  inputs,
  completions,
  themes,
  self,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs completions themes self;};

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
