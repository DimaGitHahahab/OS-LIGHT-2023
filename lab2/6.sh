#!/bin/bash

maxMem=-1
ppid=0
for file in /proc/*; do
        filename=$(basename "$file")
        if [[ "$filename" =~ ^[0-9]+$ ]]
        then
		st="$file/status"
                mem=$(awk '/VmSize/{print $2}' "$st")
		if [[ mem != "" ]]
		then
			if [[ "$mem" -gt "$maxMem" ]]
                	then
                        	maxMem="$mem"
                        	ppid="$filename"
                	fi
		fi
        fi
done

echo "proc pid: $ppid"

top -b -n1 | grep -A1 "PID" | tail -n1 | awk '{print "top pid: " $1}'
