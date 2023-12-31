#!/bin/bash

if [[ "$#" -ne 1 ]]; then
        echo "wrong number of arguments. expected: 1, got: $#"
        exit 1
fi

if [[ ! -e "$1" ]]; then
        echo "no such file: $1"
        exit
fi

if [[ ! -d ~/.trash ]]; then
        mkdir ~/.trash || { echo "Failed to create ~/.trash directory"; exit 1; }
fi

if [[ ! -e ~/.trash.log ]]; then
        touch ~/.trash.log || { echo "Failed to create ~/.trash.log file"; exit 1; }
fi

name=$(ls ~/.trash -1 | tail -n 1)

if [[ -z "$name" ]]; then
	name=1
else
	name=$((name+1))
fi

ln "$1" ~/.trash/$name || { echo "Failed to create hard link"; exit 1; }

rm "$1" || { echo "Failed to remove original file"; exit 1; }

echo "$(realpath "$1") $name" >> ~/.trash.log
echo >> ~/.trash.log

