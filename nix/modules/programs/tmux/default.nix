{ pkgs, ... }:
let
  sessionizer = pkgs.writeShellScriptBin "sessionizer" (builtins.readFile ./sessionizer);
in
{
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
    ];

    extraConfig = ''
      bind -n S-C-k select-pane -U
      bind -n S-C-j select-pane -D
      bind -n S-C-h select-pane -L
      bind -n S-C-l select-pane -R

      bind-key -r f run-shell "tmux neww '${sessionizer}/bin/sessionizer'"
    '';
  };
}
