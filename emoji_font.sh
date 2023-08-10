#!/bin/bash

font="D050000L"
function set_font {
	gsettings set org.gnome.desktop.interface font-name "$1"
	gsettings set org.gnome.desktop.interface monospace-font-name "$1"
	gsettings set org.gnome.desktop.interface document-font-name "$1"
	gsettings set org.gnome.desktop.wm.preferences titlebar-font "$1"
}

set_font $font
