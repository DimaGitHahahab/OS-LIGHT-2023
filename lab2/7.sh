#!/bin/bash

oldBytes=""
for file in /proc/*; do
        filename=$(basename "$file")
        if [[ "$filename" =~ ^[0-9]+$ ]]
        then
                io="$file/io"
                bytes=$(sudo awk '/read_bytes/{print $2}' "$io")
               	oldBytes+="$filename $bytes\n" 
        fi
done

sleep 5

dif=""
for file in /proc/*; do
        filename=$(basename "$file")
        if [[ "$filename" =~ ^[0-9]+$ ]]
        then
                io="$file/io"
                bytes=$(sudo awk '/read_bytes/{print $2}' "$io")
		oldValue=$(echo "$oldBytes" | awk '/$filename/{print $2}')
		newValue=$((bytes - oldValue))
		run=$(cat /proc/$filename/cmdline | tr -d '\0')
		dif+="$filename : $run : $newValue\n"
        fi
done


sorted=$(echo -e "$dif" | head -n -1 | sort -n -k5 -r | head -n 3 )
echo -e "$sorted"
