{...}: {
  homebrew = {
    enable = true;
    brews = [
      # hl and watch have no nixpkgs equivalent on macOS
      "hl"
      "watch"
    ];

    casks = [
      # ghostty: package managed via programs/ghostty but installed via cask
      # due to https://github.com/nix-community/home-manager/issues/6295
      "ghostty"
      "raycast"
      "rectangle"
      "spotify"

      # macOS proprietary GUI apps, not available in nixpkgs
      "docker-desktop"
      "flux-app"
      "zen"
    ];

    taps = [
    ];
  };
}
