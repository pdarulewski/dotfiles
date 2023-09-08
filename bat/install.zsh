#!/usr/bin/env zsh

themes_dir="$(bat --config-dir)/themes"
mkdir -p $themes_dir

theme="tokyonight_moon"

curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/$theme.tmTheme -o $themes_dir/$theme.tmTheme

bat cache --build
bat --list-themes | grep tokyo

echo "--theme='$theme'" >> "$(bat --config-dir)/bat.conf"
