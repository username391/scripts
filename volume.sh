#!/bin/bash

# Adwaita theme
# audio_muted="audio-volume-muted-symbolic.symbolic"
# audio_low="audio-volume-low-symbolic.symbolic"
# audio_medium="audio-volume-medium-symbolic.symbolic"
# audio_high="audio-volume-high-symbolic.symbolic"

# Breeze
audio_muted="audio-volume-muted"
audio_low="audio-volume-low"
audio_medium="audio-volume-medium"
audio_high="audio-volume-high"

function get_volume {
	pactl get-sink-volume @DEFAULT_SINK@ | grep '%' | cut -d "/" -f 2 | cut -d '%' -f 1 | sed 's/^[ \t]*//'
}

function is_muted {
	pactl get-sink-mute @DEFAULT_SINK@ | cut -d ' ' -f 2
}

function send_notification {
	# volume=`get_volume`
	volume=$(get_volume)
	muted=$(is_muted)


	if [[ "$volume" = "0" ]]; then
		icon=$audio_muted
	elif [[ "$volume" -lt "30" ]]; then
		icon=$audio_low
	elif [[ "$volume" -lt "65" ]]; then
		icon=$audio_medium
	else
		icon=$audio_high
	fi

	if [[ "$muted" = "yes" ]]; then
		notify-send "volume muted" -i "$audio_muted" -a "volume.sh"
	elif [[ "$volume" = "0" ]]; then
		notify-send "silient mode" -i "$icon" -a "volume.sh"
	else
		bar=$(seq -s "─" $(($volume/3)) | sed 's/[0-9]//g')
		notify-send "$bar" -i "$icon" -t 2000 -a "volume.sh"
	fi

}


case "$1" in
    "up")
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    "down")
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    "mute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "Error: Invalid argument. Usage: $0 [up|down|mute]"
        exit 1
        ;;
esac

send_notification
exit 0

