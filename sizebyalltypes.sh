#!/bin/bash

ftypes=$(find . -type f | grep -E ".*\.[a-zA-Z0-9]*$" | sed -e 's/.*\(\.[a-zA-Z0-9]*\)$/\1/' | awk '{print tolower($0)}' | sort | uniq)

for ft in $ftypes
do
    echo -n "$ft "
    ssize=$(find . -iname "*${ft}" -exec ls -l {} \; | awk '{total += $5} END {print total}')
    numfmt --to=iec-i --suffix=B --padding=7 $ssize
done
