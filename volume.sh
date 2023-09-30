#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Incorrect number of arguments. Usage: $0 [inc|dec|mute]"
    exit 1
fi

# Determine the operation based on the argument and print the corresponding number
case "$1" in
    "inc")
        pactl set-sink-volume @DEFAULT_SINK@ +5%
		notify-send "Volume Increased" "+5%" -i audio-volume-high-symbolic.symbolic
        ;;
    "dec")
        pactl set-sink-volume @DEFAULT_SINK@ -5%
		notify-send "Volume Decreased" "\-5%" -i audio-volume-high-symbolic.symbolic
        ;;
    "mute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
		notify-send "Volume Muted" "0%" -i audio-volume-high-symbolic.symbolic
        ;;
    *)
        echo "Error: Invalid argument. Usage: $0 [inc|dec|mute]"
        exit 1
        ;;
esac

exit 0

