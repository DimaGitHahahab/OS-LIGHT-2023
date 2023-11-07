#!/bin/bash

echo $$ > .generator_pid

while true
do
		read input
		echo "generator read this input: $input"
		echo "$input" > pipe
done
