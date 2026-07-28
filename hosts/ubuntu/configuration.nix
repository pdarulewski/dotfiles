{pkgs, lib, ...}: {
  home.homeDirectory = "/home/pd";

  home.activation.setDefaultShell = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if ! grep -qF "${pkgs.zsh}/bin/zsh" /etc/shells; then
      echo "${pkgs.zsh}/bin/zsh" | sudo tee -a /etc/shells
    fi
    if [ "$(getent passwd $USER | cut -d: -f7)" != "${pkgs.zsh}/bin/zsh" ]; then
      $DRY_RUN_CMD chsh -s ${pkgs.zsh}/bin/zsh
    fi
  '';
}

