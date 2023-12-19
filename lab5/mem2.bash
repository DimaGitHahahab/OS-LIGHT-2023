#!/bin/bash

> report2.log

my_array=()
counter=0

while true; do
    my_array+=( {1..10} )
    ((counter++))

    if ((counter % 10000 == 0)); then
        length=$(( counter * 10 ))
        echo "$length" >> report.log
    fi
done
