#!/bin/bash

echo $$ > .pid1

number=1

while true; do
  number=$((number + 1))
done

