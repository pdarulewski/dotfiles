{...}: {
  den.aspects.fonts.os = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      victor-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
    ];
  };
}
