#!/bin/bash

result=$(awk '$4 == "M3232" && $5 > 74 {print $1 " " $2 " " $3}' "$1")

count=$(echo "$result" | wc -l)

echo "Number of students: $count"

echo "$result"
