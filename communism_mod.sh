#!/bin/bash

font_download_link="https://github.com/Poul0s/42-troll/raw/master/kremlin.ttf"
font="todo"


language="todo"
keyboard_layout="todo"
wallpaper="https://wallpapercave.com/wp/wp2635708.jpg" # todo set better wp mb
color="todo"
cursor_theme="todo"

function set_font {
	gsettings set org.gnome.desktop.interface font-name "$1"
	gsettings set org.gnome.desktop.interface monospace-font-name "$1"
	gsettings set org.gnome.desktop.interface document-font-name "$1"
	gsettings set org.gnome.desktop.wm.preferences titlebar-font "$1"	
}

wget "$wallpaper" -O ~/communist_bg.jpg
gsettings set org.gnome.desktop.background picture-uri ~/communist_bg.jpg


if [ ! -z $font_download_link ] ; then
	mkdir -p ~/.local/share/fonts
	wget "$font_download_link" -O ~/.local/share/fonts/$font
fi
set_font "$font"
