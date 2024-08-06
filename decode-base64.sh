#!/bin/bash

folder='outputs'

for file in "$folder"/*; do
     name=$(echo $file | awk -F'/' '{print $2}' | awk -F'.txt' '{print $1}')
     command=$(cat $file | grep -i '"icon"' | awk -F'"' '{print $4}' | awk -F',' '{print $2}')
     if [[ $command == "" ]]; then
	echo "No icon found in $name, Skipping..."
     else
     	cat $file | grep -i '"icon"' | awk -F'"' '{print $4}' | awk -F',' '{print $2}' >> /tmp/image.b64
     	base64 -d /tmp/image.b64 > images/$name.png
     	rm -rf /tmp/image.b64
     	echo "Converted base64 image data of $file to png file at images/$name"
     fi
done
