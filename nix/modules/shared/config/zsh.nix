{ pkgs, lib, config, ... }:
{
  enable = true;

  dotDir = ".config/zsh";
  autocd = true;

  # https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
  history = {
    path = "${config.xdg.dataHome}/zsh/history";
    extended = true;
    expireDuplicatesFirst = true;
    size = 100000;
    save = 100000;
    ignoreAllDups = true;
    ignorePatterns = [
      "rm *"
      "pkill *"
    ];
  };

  historySubstringSearch = {
    enable = true;
  };

  sessionVariables = {
    THEME="ocean";
  };

  shellAliases = {
    ".." ="cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    l = "colorls -lAh --sd";

    diff = "diff --side-by-side -W $(( $(tput cols) - 2 ))";
    s = ". .venv/bin/activate";
    nr = "nix run nix-darwin -- switch --flake ~/.config/nix";
  };

  initExtra = ''
  source $HOME/.config/nix/modules/shared/config/deps/zsh.zsh
  source $HOME/.config/nix/modules/shared/config/deps/git.zsh
  source $HOME/.config/nix/modules/shared/config/deps/neofetch/neofetch.zsh
  '';

  zplug = {
    enable = true;
    plugins = [
      { name = "joshskidmore/zsh-fzf-history-search"; }
      { name = "romkatv/powerlevel10k"; }
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "zsh-users/zsh-syntax-highlighting"; }
    ];
  };
  plugins = [
          {
            name = "powerlevel10k";
            src = pkgs.zsh-powerlevel10k;
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
          }
          {
            name = "powerlevel10k-config";
            src = lib.cleanSource ../config/deps;
            file = "p10k.zsh";
          }
  ];
}
