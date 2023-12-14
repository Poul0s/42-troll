echo '#!/bin/bash

function askTig()
{
	res=$(zenity --info --text="Do you want to buy yourself a TIG ?\nyou have 3 seconds to reply" --timeout 3 --extra-button NO --ok-label YES)
	if [ "$res" = "" ]; then
		gnome-terminal -- bash ~/.local/bin/.a.sh
	fi
}

sleep 30
askTig
bash $0' > ~/.local/bin/askTig.sh
echo '#!/bin/bash
echo -e "Connecting to 10.124.82.24..."
sleep 0.1
echo -e "Connected to 10.124.82.24 succesfully"
sleep 0.2
echo -e "Collecting local browsing data for profile.intra.42.fr"
sleep 0.1
echo -n "found api key :"
echo $RANDOM | md5sum | head -c 20; echo
sleep 0.1
echo -ne "Attempting to login into \e[31m$LOGNAME\e[0m'\''s intra... "
sleep 0.2
echo -e "\e[32mSUCCESS\e[0m"
sleep 0.2
echo -n "TIG item id : "
echo $RANDOM | sha1sum | head -c 30; echo
sleep 0.1
echo -n "buying TIG... "
sleep 0.2
echo -e "\e[32mSUCCESS\e[0m"
read -n 1 -s -r -p "Press any key to continue..."
' > ~/.local/bin/.a.sh

echo 'bash ~/.local/bin/askTig.sh &' >> ~/.profile
bash ~/.local/bin/askTig.sh &
