{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.den.flakeModule];

  den.schema.user.classes = lib.mkDefault ["homeManager"];

  den.default = {
    homeManager.home.stateVersion = "25.05";
  };
}
