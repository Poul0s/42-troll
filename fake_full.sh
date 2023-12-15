echo '/usr/bin/zenity --error --title="bocal" --text="Your home is full! (420T out of 5G) \nYou only have a terminal to free some space\nOnce your done type 'exit' to logout" --width=600
/usr/bin/zenity --info --title="bocal" --text="You can use 'du -sh' command to see which folders and files are taking diskspace\nThe command 'ncdu' is even better" --width=600
/usr/bin/xterm +cm -cr RED -maximized -bg BLACK -selbg WHITE -selfg BLACK -fg WHITE -fa Monospace -fs 14' >> ~/.profile
