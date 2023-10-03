#!/bin/bash

man bash | grep -o '\b\w\{4,\}\b' | sort | uniq -c | sort -r -n | head -n 3
