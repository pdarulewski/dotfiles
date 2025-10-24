{ inputs, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.pd = {
      imports = [
        ../programs
      ];
    };
  };
}
