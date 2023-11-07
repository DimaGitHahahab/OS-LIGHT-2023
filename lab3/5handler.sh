#!/bin/bash

accumulator=1
operation_mode=0
pid=$(cat .generator_pid)

{ tail -f pipe; } | while true; do
  read input
  echo "handler read: $input"
  case "$input" in
    "+") echo "got +" ; operation_mode=0 ;;
    "*") echo "got *" ; operation_mode=1 ;;
    "QUIT")
      echo "got quit"
      echo "Success. Result: $accumulator"
      kill "$pid"
      exit 0
      ;;
    *)
      if [[ "$input" =~ ^-?[0-9]+$ ]]; then
        if [[ "$operation_mode" -eq 0 ]]; then
          accumulator=$((accumulator + input))
        else
          accumulator=$((accumulator * input))
        fi
      elif [[ "$input" != "" ]]; then
        echo "Error: invalid input: $input"
	kill "$pid"
	exit 1
      fi
      ;;
  esac
done


