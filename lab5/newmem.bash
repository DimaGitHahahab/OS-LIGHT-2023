#!/bin/bash

my_array=()
counter=0
length=0

while [[ $length -le $1 ]]; do
    my_array+=( {1..10} )
    ((counter++))
    length=$(( counter * 10 ))
done



