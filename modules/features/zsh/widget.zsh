#!/usr/bin/env zsh

# edit the command
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^Xe" edit-command-line

# zsh mv
autoload -Uz zmv

# clear screen but keep current command buffer
function clear_screen_and_scrollback() {
  echoti civis >"$TTY"
  printf '%b' '\e[H\e[2J\e[3J' >"$TTY"
  echoti cnorm >"$TTY"
  zle redisplay
}
zle -N clear_screen_and_scrollback
bindkey '^Xl' clear_screen_and_scrollback

# copy current command buffer to clipboard (macOS)
function copy_buffer_to_clipboard() {
  echo -n "$BUFFER" | pbcopy
  zle -M "Copied to clipboard"
}
zle -N copy_buffer_to_clipboard
bindkey '^Xc' copy_buffer_to_clipboard
