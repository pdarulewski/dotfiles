{
  inputs,
  den,
  lib,
  ...
}: {
  imports = [inputs.den.flakeModule];

  den.default = {
    homeManager.home.stateVersion = "25.05";
    darwin.system.stateVersion = 6;
    darwin.nix.settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "pd"];
    };

    includes = [
      den.aspects.atuin
      den.aspects.btop
      den.aspects.codespell
      den.aspects.docker
      den.aspects.eza
      den.aspects.fzf
      den.aspects.gh
      den.aspects.gh-dash
      den.aspects.ghostty
      den.aspects.git
      den.aspects.k9s
      den.aspects.kubectl
      den.aspects.lazydocker
      den.aspects.lazygit
      den.aspects.neovim
      den.aspects.oh-my-posh
      den.aspects.ripgrep
      den.aspects.tmux
      den.aspects.yamllint
      den.aspects.zoxide
      den.aspects.zsh
    ];
  };

  den.schema.user.classes = lib.mkDefault ["homeManager"];

  den.aspects.pd = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "zsh")
    ];

    homeManager = {
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

      xdg.enable = true;

      xdg.localBinInPath = true;

      home = {
        activation.createDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
          mkdir -p ${config.home.homeDirectory}/dev
          mkdir -p ${config.home.homeDirectory}/vaults
        '';
        sessionVariables = {
          BOOKMARKS = "${config.home.homeDirectory}/vaults/bookmarks.txt";
          EDITOR = "nvim";
          THEME = "rose";
          VISUAL = "nvim"; # crontab editor on MacOS
        };
      };
    };
  };
}
