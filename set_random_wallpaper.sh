#!/bin/bash

filename=`/bin/ls $1/ | xargs -n 1 basename | shuf -n 1`
notify-send "wallpaper changed" "$filename" -i "image-jpeg" -a "wallpaper-change"

feh --bg-max "$1/$filename"

