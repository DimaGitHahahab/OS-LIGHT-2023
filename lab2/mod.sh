#!/bin/bash

pid_creator=$(ps axo pid,user | awk -v id=$1 '$1==id {print $2}')

echo "user: $pid_creator"

pid_creator_count=$(ps axo user | awk -v u=$pid_creator '$1==u {count++} END {print count}')

users=$(ps axo user | awk '{print $1}' | sort | uniq | grep -v "USER")

res=1
for usr in $users; do
    usr_process_count=$(ps axo user | awk -v u=$usr '$1==u {count++} END {print count}')
    #echo "$usr : $usr_process_count"
    if [[ $usr_process_count -gt $pid_creator_count ]]; then
	res=$((res+1))
    fi
done

echo $res



