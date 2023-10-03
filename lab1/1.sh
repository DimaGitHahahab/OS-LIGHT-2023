#!/bin/bash

if [[ $# -ne 3 ]]
then 
	echo "invalid number of arguments"
	exit 2
fi

if [[ $1 -gt $2 ]]
then
	a=$2
else
	a=$2
fi

if [[ $3 -gt $a ]]
then
	echo $3
else
	echo $a
fi
