{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    victor-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];
}
