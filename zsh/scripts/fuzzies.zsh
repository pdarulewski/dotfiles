#!/usr/bin/env zsh

bookmarks_file="$HOME/.config/_personal/bookmarks.txt"

function arc() {
    local selected_line selected_url
    selected_line=$(cat $bookmarks_file | fzf)

    if [[ -n "$selected_line" ]]; then
        selected_url=$(echo "$selected_line" | awk '{print $1}')
        open -a Arc "$selected_url"
    fi
}

function bookmark() {
    if [[ -n "$1" ]]; then
        echo "$1" >> $bookmarks_file
    else
        cat $bookmarks_file
    fi
}
