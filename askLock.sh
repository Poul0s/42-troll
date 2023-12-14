echo '#!/bin/bash

function askLock()
{
	res=$(zenity --info --text="Do you want to lock" --timeout 7 --extra-button NO --ok-label YES)
	if [ "$res" = "" ]; then
		ft_lock
	fi
}

sleep 30
askLock
bash $0' > ~/.local/bin/askLock.sh

echo 'bash ~/.local/bin/askLock.sh &' >> ~/.profile
bash ~/.local/bin/askLock.sh &
