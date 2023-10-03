#!/bin/bash

numbers=""

while true; do
	read input
	if [[ $input == "q" ]]
	then
		break
	else
		numbers+=" $input"
	fi
done

echo $numbers
