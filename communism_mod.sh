#!/bin/bash

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

set_font "$font"

wget "$wallpaper" -O ~/communist_bg.jpg
gsettings set org.gnome.desktop.background picture-uri ~/communist_bg.jpg
