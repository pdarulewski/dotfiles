#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  explicit_dirs=(
    "$HOME"
    "$HOME/.config"
    "$HOME/repo"
    "$HOME/Downloads/"
  )

  repos=$(find ~/repo -mindepth 1 -maxdepth 3 -type d)
  vaults=$(find ~/vaults -mindepth 1 -maxdepth 1 -type d)
  utils=$(find ~/utils -mindepth 1 -maxdepth 1 -type d)

  all_dirs=("${explicit_dirs[@]}" "$repos" "$vaults" "$utils")

  selected=$(printf '%s\n' "${all_dirs[@]}" | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected"
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
