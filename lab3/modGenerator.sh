#!/bin/bash

echo $$ > .generator_pid

echo -e "1 -> russian\n2 -> english\n3 -> chinese\n4 -> polish\nq -> quit"

while true
do
        read input
        echo "generator read this input: $input"
        case "$input" in
                "1")
                        kill -SIGUSR1 $(cat .handler_pid)
                        ;;
                "2")
                        kill -SIGUSR2 $(cat .handler_pid)
                        ;;
                "3")
                        kill -SIGRTMIN+1 $(cat .handler_pid)
                        ;;
		"4")
                        kill -SIGRTMIN+2 $(cat .handler_pid)
                        ;;

		"q")
                        kill -SIGTERM $(cat .handler_pid)
                        ;;
                *)
                        echo "unexpected input"
                        ;;
        esac
done

