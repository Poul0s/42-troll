#!/bin/bash

keybinding_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom50/"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$keybinding_path binding "l"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$keybinding_path command 'ft_lock'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$keybinding_path name 'i am a system thing, dont look at me'

bash << EOF
current_value=\$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
new_value="'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom50/'"

if [ "\$current_value" == "@as []" ]; then
  updated_value="[\$new_value]"
else
  current_value="\${current_value:1:-1}"
  updated_value="[\$current_value, \$new_value]"
fi

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "\$updated_value"
EOF
