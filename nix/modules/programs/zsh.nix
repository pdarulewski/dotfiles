{ config, ... }:
{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    # enableCompletions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nix run nix-darwin -- switch --flake .#pd-macos-intel";
    };

    initContent = ''
      source /Users/pd/.config/zsh/.copy.zshrc
    '';
  };
}
