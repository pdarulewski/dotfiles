#!/usr/bin/env zsh

alias -g NE='2>/dev/null'
alias -g NO='>/dev/null'
alias -g NUL='>/dev/null 2>&1'

alias -g J='| jq'
alias -g C='| pbcopy'
alias -g F='| fzf'

function mkd() {
  mkdir -p "$@" && cd "$_"
}

function bk() {
  if [[ -n "$1" ]]; then
    echo "$1" >>$BOOKMARKS
  else
    local selected_line selected_url
    selected_line=$(cat $BOOKMARKS | fzf)

    if [[ -n "$selected_line" ]]; then
      selected_url=$(echo "$selected_line" | awk '{print $1}')
      open "$selected_url"
    fi
  fi
}
