#!/bin/bash

echo $$ > .generator_pid

while true
do
	read input
        echo "generator read this input: $input"
        case "$input" in
		"+")
			kill -USR1 $(cat .handler_pid)
			;;
		"*")
      			kill -USR2 $(cat .handler_pid)
      			;;
    		"TERM")
      			kill -SIGTERM $(cat .handler_pid)
      			;;
    		*)
      			:
			;;
  	esac
done


