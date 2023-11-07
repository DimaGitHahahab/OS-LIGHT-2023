#!/bin/bash

./4_1.sh &
./4_2.sh &
./4_3.sh &

first=$(cat .pid1)
third=$(cat .pid3)

cpulimit -p "$first" -l 10

kill "$third"
