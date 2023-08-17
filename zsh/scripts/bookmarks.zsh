#!/usr/bin/env zsh

bookmarks_file="$HOME/bookmarks.txt"

function arc() {
    local selected_url
    selected_url=$(cat $bookmarks_file | fzf )
    [[ -n "$selected_url" ]] && open -a Arc "$selected_url"
}

function bookmark() {
    if [[ -n "$1" ]]; then
        echo "$1" >> $bookmarks_file
    else
        cat $bookmarks_file
    fi
}
