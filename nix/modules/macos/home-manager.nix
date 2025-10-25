{ inputs, themes, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit themes; };


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
