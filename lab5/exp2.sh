#!/bin/bash

n=7700000
k=30

for (( i=0; i<k; i++ )); do
  ./newmem.bash $n &
  sleep 1
done
