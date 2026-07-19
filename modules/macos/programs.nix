{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  # disable global completions, so they don't load twice
  # https://github.com/nix-community/home-manager/issues/108
  programs.zsh.enableCompletion = false;

  fonts.packages = with pkgs; [
    victor-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];
}
