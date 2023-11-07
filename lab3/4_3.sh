#!/bin/bash

echo $$ > .pid3

number=1

while true; do
  number=$((number * 2))
done
