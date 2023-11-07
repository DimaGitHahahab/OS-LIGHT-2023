#!/bin/bash

accumulator=1
echo $$ > .handler_pid

add() {
	echo "addition"
	accumulator=$((accumulator+1))
}

mult() {
	echo "multiplication"
	accumulator=$((accumulator*2))
}

sig_termination() {
	echo "Success. Result: $accumulator"
	kill $(cat .generator_pid)
	exit 1
}

trap 'add' USR1
trap 'mult' USR2
trap  'sig_termination' SIGTERM

while true
do
	sleep 1
done
