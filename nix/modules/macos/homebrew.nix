{ ... }:
{
  homebrew = {
    enable = true;
    brews = [
      "git-delta"
      "neofetch"
      "onefetch"

      "fd"
      "git-lfs"
      "gnupg"
      "jq"
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
