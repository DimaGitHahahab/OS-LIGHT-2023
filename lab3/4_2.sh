#!/bin/bash

echo $$ > .pid2
number=1

while true; do
  number=$((number + 2))
done
