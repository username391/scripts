#!/bin/bash

if [[ $@ == *'-clipboard'* ]]
then
	scrot -e 'xclip -selection clipboard -t image/png -i $f'
	notify-send "Screenshot" "Copied in clipboard"
else
	scrot ~/Pictures/%b%d_%H_%M_%S.png
	notify-send "Screenshot" "Screenshot saved!"
fi


