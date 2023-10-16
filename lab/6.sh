#!/bin/bash

ps aux | sort -k4 -r | awk '(NR==2) {print $2 " " $4 " "$11}'
