{den, ...}: {
  den.hosts.x86_64-linux.nuno.users.pd = {};

  den.aspects.nuno = {
    includes = [
      den.aspects.configuration
      den.aspects.fonts
      den.aspects.hardware-configuration
    ];
  };
}
