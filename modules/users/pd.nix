{den, ...}: {
  den.aspects.pd = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "zsh")

      den.aspects.features
    ];
  };
}
