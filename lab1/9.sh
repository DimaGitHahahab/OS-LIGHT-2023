#!/bin/bash

find /var/log -type f -name "*.log" | xargs cat | wc -l
