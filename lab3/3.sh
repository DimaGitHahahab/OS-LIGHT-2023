#!/bin/bash

current_day=$(date +'%u')

(crontab -l ; echo  "*/1 * * * $current_day ~/Desktop/OS-LIGHT-2023/lab3/1.sh") | crontab -

