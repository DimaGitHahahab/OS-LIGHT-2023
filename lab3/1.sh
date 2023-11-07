#!/bin/bash

current_date_time=$(date +'%Y-%m-%d_%H:%M:%S')

mkdir ~/test && {
	echo "catalog test was created successfully" > ~/report
	touch ~/test/"${current_date_time}_test"
}

ping "www.net_nikogo.ru" || {
	current_date_time=$(date +'%Y-%m-%d_%H:%M:%S')
	echo "$current_date_time error: www.net_nikogo.ru cannot be accessed" >> ~/report
}
