{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.den.flakeModule];

  den.schema.user.classes = lib.mkDefault ["homeManager"];

  den.default = {
    homeManager.home.stateVersion = "25.05";
    darwin.system.stateVersion = 6;
    darwin.nix.settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "pd"];
    };
  };
}
