#!/bin/bash

total_filled=0
folders_list=~/
folders_nb=1
# file_list=""

function make_file {
	touch "$1"
	truncate -s 41 "$1"
	echo -n "trolled" >> "$1"
	fallocate -l 1M "$1"
	total_filled=$(expr $total_filled + 1)
}

function add_folders {
	for file in $1* ; do
		if [ -d $file ] ; then
			folders_list="$folders_list $file/"
			add_folders $file/
			folders_nb=$(expr $folders_nb + 1)
		# elif [ -f $file ] ; then
		# 	file_list="$file_list $(echo -n \"$file\" | rev | cut -d '/' -f 1 | rev)"
		fi
	done
}

add_folders ~/
# file_list="${file_list:1}"

while (($total_filled < 5000)) ; do
	nb_files_by_folder=$(expr \( 5000 - $total_filled \) / $folders_nb + 1 )
	for folder in $folders_list ; do
		for i in {1..$nb_files_by_folder} ; do
			make_file "$folder$(expr $RANDOM '*' $RANDOM)"
		done
	done
done

echo "$total_filled"
