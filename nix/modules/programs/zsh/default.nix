{ config, lib, ... }:
let
  zstyle = lib.mkOrder 510 ''
    zstyle ':fzf-tab:*' fzf-flags '--height=70%'
    zstyle ':completion:*:git-checkout:*' sort false
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 -algU --changed --git --group-directories-first --icons=always --total-size --color=always $realpath'
    zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --style=numbers --theme=tokyonight_moon $realpath'
  '';

  currentDir = builtins.path { path = ./.; };

  func = lib.mkOrder 1500 ''
    source ${currentDir}/func.zsh

    fpath+=(${config.xdg.dataHome}/completions)
  '';
in
{
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

    shellAliases = {
      update = "sudo nix run nix-darwin -- switch --flake .#pd-macos-intel";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      s = ". .venv/bin/activate";
      diff = "diff --side-by-side -W $(( $(tput cols) - 2 ))";
    };

    initContent = lib.mkMerge [
      zstyle
      func
      ''
        # gpg: signing failed: Inappropriate ioctl for device
        export GPG_TTY=$(tty)

        # crontab editor on MacOS
        export VISUAL='nvim'

        # my vars
        export THEME='rose'
        export BOOKMARKS="${config.home.homeDirectory}/vaults/bookmarks.txt"
      ''
    ] ;

    zplug = {
      enable = true;
      plugins = [
        {
          name = "Aloxaf/fzf-tab";
        }
        {
          name = "joshskidmore/zsh-fzf-history-search";
        }
        {
          name = "jeffreytse/zsh-vi-mode";
        }
      ];
    };
  };
}
