#!/bin/bash

arguments='-b 3 '
filename="Pictures/Screenshots/$(date +%s%3N).png"
full_path="$HOME/$filename"
rel_path="~/$filename"


if [[ $@ == *'--area'* ]]; then
	arguments+='-s -o '
fi

if [[ $@ == *'--window'* ]]; then
	if [[ $@ == *'--clipboard'* ]]; then
		maim -o -st 9999999 | convert - \( +clone -background black -shadow 80x3+5+5 \) +swap -background none -layers merge +repage png:- | xclip -selection clipboard -t image/png
		notify-send -i "image-gif" "Screenshot of window saved!" "to clipboard"
	else
		maim -o -st 9999999 | convert - \( +clone -background black -shadow 80x3+5+5 \) +swap -background none -layers merge +repage $full_path
		notify-send -i "image-gif" "Screenshot saved!" "$rel_path"
	fi

else
	if [[ $@ == *'--clipboard'* ]]; then
		maim $arguments | xclip -selection clipboard -t image/png
		notify-send -i "image-gif" "Screenshot saved!" "to clipboard"
	else
		maim $arguments $full_path
		notify-send -i "image-gif" "Screenshot saved!" "$rel_path"
	fi
fi

