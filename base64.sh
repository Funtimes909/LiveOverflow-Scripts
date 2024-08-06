#!/bin/bash

FILE='servers.txt'

if [ ! -f "$FILE" ]; then
    echo "Error: Please specify a serverrs.txt file"
    exit 1
fi

while IFS= read -r line; do
    touch outputs/$line.txt
    mcstatus $line json | jq '.' >> outputs/$line.txt
    echo "Wrote json data to outputs/$line.txt"

done < "$FILE"
