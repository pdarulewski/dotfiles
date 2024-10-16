{ pkgs, ... }:

{
  enable = true;

  baseIndex = 1;
  clock24 = true;
  customPaneNavigationAndResize = true;
  escapeTime = 0;
  historyLimit = 100000;
  mouse = true;
  newSession = true;
  shell = "${pkgs.zsh}/bin/zsh";

  extraConfig = ''
    set -g default-terminal "xterm-256color"
    set -ga terminal-overrides ",xterm-256color:Tc"

    bind-key -r f run-shell "tmux neww /Users/pd/.config/nix/modules/shared/config/deps/sessionizer.sh"

    # Tokyonight Storm
    # Upstream: https://github.com/folke/tokyonight.nvim/blob/main/extras/tmux_tokyonight_storm.tmux
    set -g mode-style "fg=#7aa2f7,bg=#3b4261"

    set -g message-style "fg=#7aa2f7,bg=#3b4261"
    set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

    set -g pane-border-style "fg=#3b4261"
    set -g pane-active-border-style "fg=#7aa2f7"

    set -g status "on"
    set -g status-justify "left"

    set -g status-style "fg=#7aa2f7,bg=#1f2335"

    set -g status-left-length "100"
    set -g status-right-length "100"

    set -g status-left-style NONE
    set -g status-right-style NONE

    set -g status-left "#[fg=#1D202F,bg=#7aa2f7,bold] #S #[fg=#7aa2f7,bg=#1f2335,nobold,nounderscore,noitalics]"
    set -g status-right "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#1f2335] #{prefix_highlight} #[fg=#3b4261,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d Week: %V  %H:%M #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#1D202F,bg=#7aa2f7,bold] #h "

    setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#1f2335"
    setw -g window-status-separator ""
    setw -g window-status-style "NONE,fg=#a9b1d6,bg=#1f2335"
    setw -g window-status-format "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]"
    setw -g window-status-current-format "#[fg=#1f2335,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261,bold] #I  #W #F #[fg=#3b4261,bg=#1f2335,nobold,nounderscore,noitalics]"
  '';
}
