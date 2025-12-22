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

      "spicetify-cli"
    ];

    casks = [
      "font-symbols-only-nerd-font"
      "font-fira-code"
      "font-victor-mono"

      "docker-desktop"
      "flux-app"
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
