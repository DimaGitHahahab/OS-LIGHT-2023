#!/bin/bash

while true; do
	echo "1 -> nano"
	echo "2 -> vim"
	echo "3 -> links"
	echo "4 -> exit"
	read input
	case $input in
		1 ) nano ;;
		2 ) vi ;;
		3 ) links ;;
		4 ) break ;;
		* ) echo "invalid argument" && break ;;
	esac
done
