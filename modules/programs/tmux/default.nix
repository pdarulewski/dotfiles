{pkgs, ...}: let
  sessionizer = pkgs.writeShellScriptBin "sessionizer" (builtins.readFile ./sessionizer);

  sekki = pkgs.writeShellScriptBin "sekki" ''
    cache="/tmp/tmux_sekki_$$_cache"
    today=$(date +%Y-%m-%d)

    if [ -f "/tmp/tmux_sekki_cache" ] && [ "$(head -1 /tmp/tmux_sekki_cache)" = "$today" ]; then
      tail -1 /tmp/tmux_sekki_cache
      exit 0
    fi

    today_num=$(date +%m%d)

    result=$(${pkgs.jq}/bin/jq -r --arg t "$today_num" '
      map(. + {n: (.start | gsub("-"; ""))}) |
      [ .[] | select((.n | tonumber) <= ($t | tonumber)) ] |
      sort_by(.n | tonumber) |
      last |
      "\(.sekki) \(.sekki_en) — \(.ko) \(.ko_en)"
    ' ${./sekki.json})

    printf '%s\n%s\n' "$today" "$result" > /tmp/tmux_sekki_cache
    echo "$result"
  '';
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
          set -g @rose_pine_host 'off'
          set -g @rose_pine_user 'off'
          set -g @rose_pine_date_time '%H:%M %Y-%m-%d Week: %V'
          set -g @rose_pine_show_current_program 'on'
          set -g @rose_pine_status_right_prepend_section '#(${sekki}/bin/sekki) | '
        '';
      }
      {
        plugin = vim-tmux-navigator;
        extraConfig = ''
        '';
      }
      {
        plugin = extrakto;
        extraConfig = ''
          set -g @extrakto_insert_key "enter"
          set -g @extrakto_copy_key "tab"
        '';
      }
    ];

    extraConfig = ''
      unbind '"'
      unbind %
      bind v split-window -h -p 25
      bind s split-window -v

      bind-key -r f run-shell "tmux neww '${sessionizer}/bin/sessionizer'"

      # Zellij-like pane frames
      set -g pane-border-status top
      set -g pane-border-format " [ ###P #W ] "
      set -g pane-border-lines double

      # Active pane border colors (Rose Pine Moon colors)
      set -g pane-active-border-style "fg=#ea9a97,bg=default"
      set -g pane-border-style "fg=#393552,bg=default"
    '';
  };
}
