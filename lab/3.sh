#!/bin/bash

ps au | sort -k9 -r | awk 'NR==2 {print $2 " " $9 " " $11}'
