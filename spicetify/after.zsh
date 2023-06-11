#!/usr/bin/env zsh

git clone https://github.com/catppuccin/spicetify.git
cp -r spicetify/catppuccin-* Themes/
cp spicetify/js/* Extensions/

spicetify backup apply
