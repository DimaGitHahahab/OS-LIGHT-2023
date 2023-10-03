#!/bin/bash

grep -E "(WW)|(II)" /var/log/anaconda/X.log | sed 's/(WW)/Warning:/g; s/(II)/Information:/g' > full.log

cat full.log
