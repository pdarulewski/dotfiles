{ ... }:
{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    # enableCompletions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      # update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 5000;
      path = "$HOME/.zsh_history";
    };
  };
}
