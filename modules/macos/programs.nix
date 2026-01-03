{...}: {
  # disable global completions, so they don't load twice
  # https://github.com/nix-community/home-manager/issues/108
  programs.zsh.enableCompletion = false;
}
