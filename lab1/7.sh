#!/bin/bash

grep -E -r -o -h -a "[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]+" /etc | uniq | sed -z 's/\n/, /g' | sed 's/, $//g' > emails.lst
