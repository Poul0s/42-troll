#!/bin/bash

mkdir -p ~/.local/share/
echo 'while [ 1 ]; do gsettings set org.gnome.desktop.peripherals.keyboard delay "uint32 $(shuf -i 10-200 -n 1)"; sleep 50; done' > ~/.local/share/keyboard_delay_randomizer.sh
# echo 'bash ~/.local/share/keyboard_delay_randomizer.sh &' >> ~/.profile
