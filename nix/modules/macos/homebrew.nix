{ ... }:
{
  homebrew = {
    enable = true;
    brews = [
      "oh-my-posh"
      "tmux"

      "btop"
      "git-delta"
      "k9s"
      "lazydocker"
      "lazygit"
      "neovim"
      "neofetch"

      "bat"
      "fd"
      "fzf"
      "gh"
      "git"
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
