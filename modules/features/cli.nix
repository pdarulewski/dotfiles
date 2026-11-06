{...}: {
  den.aspects.cli.homeManager = {
    config,
    lib,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
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

      # dev
      bruno
      bruno-cli

      # kubernetes
      argocd
      kubernetes-helm
      kubectx

      # nvim
      tree-sitter

      # misc
      # neofetch
      # onefetch
      claude-code
      chafa
      rectangle
      spicetify-cli
    ];

    home = {
      activation.createValutsDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
        mkdir -p ${config.home.homeDirectory}/vaults
      '';

      sessionVariables = {
        BOOKMARKS = "${config.home.homeDirectory}/vaults/bookmarks.txt";
      };
    };
  };
}
