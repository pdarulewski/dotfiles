{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  # disable global completions, so they don't load twice
  # https://github.com/nix-community/home-manager/issues/108
  programs.zsh.enableCompletion = false;

  environment.systemPackages = with pkgs; [
    # general
    fd
    jq
    tree
    wget

    # git
    delta
    git-lfs

    # security
    gnupg

    # misc
    # neofetch
    # onefetch
    claude-code
    chafa

    # kubernetes
    argocd
    kubernetes-helm
    kubectx

    # nvim
    tree-sitter

    rectangle
    spicetify-cli
  ];

  fonts.packages = with pkgs; [
    victor-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];
}
