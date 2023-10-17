#!/bin/bash

res=$(ps | tail -n +2 | awk '{print $1 " " $4}')

count=$(echo "$res" | wc -l)

echo "$count" > task1.txt

echo "$res" >> task1.txt
