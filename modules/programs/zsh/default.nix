{
  config,
  lib,
  pkgs,
  ...
}: let
  zstyle = lib.mkOrder 510 ''
    zstyle ':fzf-tab:*' fzf-flags '--height=70%'
    zstyle ':completion:*:git-checkout:*' sort false
    zstyle ':completion:*:gwo:*' sort false
    zstyle ':completion:*:gwb:*' sort false
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 -algU --changed --git --group-directories-first --icons=always --color=always --no-filesize $realpath'
    zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 -algU --changed --git --group-directories-first --icons=always --color=always --no-filesize $realpath'
    zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --style=numbers --theme=ansi $realpath'
  '';

  currentDir = builtins.path {path = ./.;};

  func = lib.mkOrder 1500 ''
    # add brew on arm fix
    if [[ $(uname -m) == 'arm64' ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    source ${currentDir}/func.zsh
    source ${currentDir}/func_chpwd.zsh
    source ${currentDir}/widget.zsh

    if [ -f "${config.xdg.configHome}/_personal/func.zsh" ]; then
      source ${config.xdg.configHome}/_personal/func.zsh
    fi

    fpath+=(${config.xdg.dataHome}/completions)

    source <(${pkgs.fzf}/bin/fzf --zsh)
    eval "$(atuin init zsh)"
  '';
in {
  programs.zsh = {
    enable = true;

    zprof = {
      enable = false;
    };

    enableCompletion = true;

    autocd = true;
    autosuggestion.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      append = true;
      expireDuplicatesFirst = true;
      extended = true;
      findNoDups = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      save = 1000000;
      saveNoDups = true;
      share = true;
      size = 1000000;
    };

    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      GPG_TTY = "$(tty)"; # gpg: signing failed: Inappropriate ioctl for device
    };

    shellAliases = {
      update_all = "nix flake update";
      update_apple = "sudo nix run nix-darwin -- switch --flake .#pd-macos-apple";
      update_intel = "sudo nix run nix-darwin -- switch --flake .#pd-macos-intel";
      prune = "nix-store --gc"; # https://nixos.wiki/wiki/Cleaning_the_nix_store

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      diff = "diff --side-by-side -W $(( $(tput cols) - 2 ))";
      jqpb = "pbpaste | jq '.' | pbcopy";
      v = "nvim";
    };

    initContent = lib.mkMerge [
      zstyle
      func
    ];

    zplug = {
      enable = true;
      plugins = [
        {
          name = "Aloxaf/fzf-tab";
        }
      ];
    };
  };
}
