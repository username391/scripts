#!/bin/bash

arguments=''

if [[ $@ == *'--area'* ]]; then
    # Wait for a brief moment to give the user time to select the area manually
    sleep 1
    arguments='-s '
fi

if [[ $@ == *'--clipboard'* ]]; then
    notify-send "head" "$arguments"
    # Use the scrot command directly without the -s option for area selection
    scrot $arguments -e 'xclip -selection clipboard -t image/png -i $f && rm $f'
    notify-send "Screenshot" "Copied to clipboard"
else
    scrot $arguments ~/Pictures/%b%d_%H_%M_%S.png
    notify-send "Screenshot" "Screenshot saved!"
fi

