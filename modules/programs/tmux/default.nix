{pkgs, ...}: let
  sessionizer = pkgs.writeShellScriptBin "sessionizer" (builtins.readFile ./sessionizer);
in {
  programs.tmux = {
    enable = true;

    shortcut = "a";
    mouse = true;
    historyLimit = 10000;
    escapeTime = 0;
    clock24 = true;
    baseIndex = 1;
    terminal = "xterm-256color";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'moon'
          set -g @rose_pine_host 'on'
          set -g @rose_pine_date_time '%H:%M %Y-%m-%d Week: %V'
          set -g @rose_pine_user 'on'
          set -g @rose_pine_show_current_program 'on'
        '';
      }
      {
        plugin = vim-tmux-navigator;
        extraConfig = ''
          set -g @vim_navigator_mapping_prev ""  # removes the C-\ binding
        '';
      }
    ];

    extraConfig = ''
      unbind '"'
      unbind %
      bind v split-window -h
      bind s split-window -v

      bind-key -r f run-shell "tmux neww '${sessionizer}/bin/sessionizer'"
    '';
  };
}
