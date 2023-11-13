#!/bin/bash

if [ "$#" -eq 0 ]; then
    video_url=$(echo "" | dmenu -p "Video url: ")
    directory=$(ls "$HOME/Videos/" | dmenu -l 5 -p "Путь до папки: ")

elif [ "$#" -eq 1 ]; then
    video_url="$1"
    directory=$(ls "$HOME/Videos/" | dmenu -l 5 -p "Путь до папки: ")
else
	video_url=$1
	directory=$2
fi

if [ -z "$video_url" ] || [ -z "$directory" ]; then
	echo "Video url or directory is not passed!"
	notify-send "Video url or directory is not passed!"
else
	$HOME/scripts/yt-dlp.sh -o "$HOME/Videos/$directory/%(title)s [%(id)s].%(ext)s" "$1"
	notify-send "Video downloaded to $directory dir"
fi

