#!/bin/bash

video_url=$1
directory=$2

yt-dlp -o "$HOME/Videos/$directory/%(title)s [%(id)s].%(ext)s" "$1"

notify-send "Video downloaded to $directory dir"
