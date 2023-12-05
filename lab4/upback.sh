#!/bin/bash

dateRegex="[0-9]{4}-[0-1][0-9]-[0-3][0-9]"
lastDate=$(ls ~ | grep -E "^Backup-${dateRegex}$" | sort | tail -n 1 | awk -F - '{print $2"-"$3"-"$4}') 

if [[ $lastDate == "--" ]]; then
  echo "You don't have any backups."
  exit 1
fi

if [[ ! -d ~/restore ]]; then
  mkdir ~/restore
fi

for file in `ls ~/Backup-$lastDate`; do
  if [[ ! $file =~ .${dateRegex}$ ]]; then
    cp ~/Backup-$lastDate/$file ~/restore/$file
  fi
done
