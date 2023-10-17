#!/bin/bash

count=0.0
sum=0.0
ppid=-1
curr=-1
art=0
res=""

while read -r line; do
    curr=$(echo "$line" | awk -F'Parent_ProcessID=' '{print $2}' | awk '{print $1}' | cut -d' ' -f 1)
    art=$(echo "$line" | awk -F'Average_Running_Time=' '{print $2}' | awk '{print $1}' | cut -d' ' -f 1)

    if [[ "$ppid" -eq -1 ]]
    then
	ppid=$curr
    fi

    if [[ $curr -eq $ppid ]]; then
        count=$(echo "$count + 1.0" | bc -l)
        sum=$(echo "$sum + $art" | bc -l)
    else
	average=$(echo "$sum / $count" | bc -l)
        res+="Average_Running_Children_of_ParentID=$ppid is $average\n"
        sum=$art
        count=1.0
    fi

    ppid=$curr
    res="$res$line\n"

done < task4.txt

average=$(echo "$sum / $count" | bc -l)
res+="Average_Running_Children_of_ParentID=$ppid is $average\n"



echo -e "$res" > task5.txt
