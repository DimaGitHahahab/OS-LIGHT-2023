#!/bin/bash

res=""
for file in /proc/*; do
        filename=$(basename "$file")
        if [[ "$filename" =~ ^[0-9]+$ ]]
	then
        	st="$file/status"
		ppid=$(awk '/PPid/{print $2}' "$st" )
		sched="$file/sched"
		sum=$(awk '/se.sum_exec_runtime/{print $3}' "$sched")
		sw=$(awk '/nr_switches/{print $3}' "$sched")
		art=$(echo "$sum / $sw" | bc -l)
		res="$res$filename : $ppid : $art\n"
        fi
done

sortedRes=$(echo -e "$res" | tr -d ' ' | sort -t ':' -k2,2n)

final=$(echo -e "$sortedRes" | awk -F':' '{print "ProcessID=" $1 " : Parent_ProcessID=" $2 " : Average_Running_Time="$3}')

echo -e "$final" | awk 'NR > 1' > task4.txt

