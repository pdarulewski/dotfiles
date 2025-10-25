{ ... }:
{
  homebrew = {
    enable = true;
    brews = [
      "git-delta"
      "lazydocker"
      "neovim"
      "neofetch"

      "bat"
      "fd"
      "fzf"
      "gh"
      "git-lfs"
      "gnupg"
      "jq"
      "ripgrep"
      "tree"
      "wget"

      "helm"
      "kubectl"
      "kubectx"

      "luarocks"

      "spicetify-cli"
    ];

    casks = [
      "font-symbols-only-nerd-font"
      "font-fira-code"
      "font-victor-mono"

      "docker-desktop"
      "ghostty"
      "raycast"
      "rectangle"
      "spotify"
      "zen"
    ];

    taps = [
    ];
  };
}
