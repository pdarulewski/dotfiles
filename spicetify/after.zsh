#!/usr/bin/env zsh

git clone https://github.com/catppuccin/spicetify.git $XDG_DATA_HOME/spicetify/catppuccin
ln -s $XDG_DATA_HOME/spicetify/catppuccin $XDG_DATA_HOME/spicetify/Themes
rm -rdf spicetify-catppuccin-tmp

spicetify config current_theme catppuccin
spicetify config color_scheme frappe
spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
spicetify apply

git clone https://github.com/CharlieS1103/spicetify-extensions.git $XDG_DATA_HOME/spicetify/spicetify-extensions
ln -s $XDG_DATA_HOME/spicetify/spicetify-extensions/adblock/adblock.js $XDG_DATA_HOME/spicetify/Extensions/
spicetify config extensions adblock.js

spicetify apply
