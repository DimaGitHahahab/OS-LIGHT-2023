#!/bin/bash

week=$(date -d "-7days" +"%F")

latest_backup=$(ls ~/ | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | tail -1)
latest_backup_path=""

if [[ ! -e ~/backup-report ]]; then
    touch ~/backup-report
fi

if [[ $latest_backup != "" ]]; then
    latest_backup_date=$(date --date=$(echo $latest_backup | sed "s/^Backup-//") +"%F")
    if [[ $latest_backup_date < $week ]]; then
        latest_backup_path=~/Backup-$(date +"%F")
        echo Backup-$(date +"%F") >> ~/backup-report
        mkdir $latest_backup_path
    else
        latest_backup_path=~/$latest_backup
    fi
else
    latest_backup_path=~/Backup-$(date +"%F")
    mkdir $latest_backup_path
fi

for file_name in $(ls ~/source); do
    source_path=~/source/$file_name
    backup_file_path=$latest_backup_path/$file_name

    if [[ -e $backup_file_path && $(stat $backup_file_path -c%s) -ne $(stat $source_path -c%s) ]]; then
        touch $backup_file_path.$(date +"%F")
        mv $backup_file_path $backup_file_path.$(date +"%F")
        cp $source_path $backup_file_path
        echo "Updated: $file_name.$(date +"%F")" >> ~/backup-report
    else
        cp $source_path $backup_file_path
        echo "Copied: $file_name" >> ~/backup-report
    fi
done

