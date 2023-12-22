#!/usr/bin/env zsh

git clone https://github.com/catppuccin/spicetify.git spicetify-catppuccin-tmp
cp -r spicetify-catppuccin-tmp/catppuccin spicetify/Themes/
rm -rdf spicetify-catppuccin-tmp

spicetify config current_theme catppuccin
spicetify config color_scheme frappe
spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
spicetify apply

git clone https://github.com/CharlieS1103/spicetify-extensions.git
cp spicetify-extensions/adblock/adblock.js spicetify/Extensions
spicetify config extensions adblock.js
rm -rdf spicetify-extensions

spicetify apply
