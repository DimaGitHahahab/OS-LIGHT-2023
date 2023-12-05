#!/bin/bash

if [[ ! -e ~/.trash.log ]]; then
	echo "no .trash.log, untrash cannot run"
	exit 1
fi

if [[ ! -d ~/.trash ]]; then
	echo "no .trash/, untrash cannot run"
fi

if [[ "$#" -ne 1 ]]; then
	echo "wrong number of arguments. expected: 1, got: $#"
	exit 1
fi

lines=$(grep "$1" ~/.trash.log)


IFS=$'\n'
for line in $lines; do
    dir=$(dirname "$line")
    filename_with_code=$(basename "$line")
    filename=$(echo "$filename_with_code" | awk '{print $1}')
    code=$(echo "$filename_with_code" | awk '{print $2}')
    echo "$dir/$filename"
    read -p "Do you want to recover it? (y/n): " answer

    while [[ ! "$answer" =~ ^[yn]$ ]]; do
        read -p "Invalid input. Please enter 'y' or 'n': " answer
    done

    if [ "$answer" == "y" ]; then
	if [[ ! -d "$dir" ]]; then
		echo "$dir was removed, trying to recover file into home directory..."
		dir="~/"
	fi
	ln ~/.trash/$code $dir/$filename
	rm ~/.trash/$code
    fi
done
unset IFS
