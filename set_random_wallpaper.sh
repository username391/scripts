#!/bin/bash

IMAGES_DIRECTORY=$1

filename=`/bin/ls $IMAGES_DIRECTORY/*jpg | xargs -n 1 basename | shuf -n 1`
notify-send "wallpaper changed" "$filename" -i "image-jpeg" -a "wallpaper-change"

# feh --bg-fill --randomize $IMAGES_DIRECTORY
feh --bg-fill "$IMAGES_DIRECTORY/$filename"

