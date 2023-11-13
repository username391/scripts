#!/bin/sh

# download video and display download progress bar using notifications

ID="$($HOME/scripts/notify-id.sh lock)"
# custom title from parent shell
if [ "$1" = "--notify-title" ]; then
	PRE_TITLE="$2"
	shift
	shift
fi
TITLE="$(yt-dlp --quiet --simulate --print title "$@")"
[ -n "$PRE_TITLE" ] \
	&& TITLE="${PRE_TITLE}\n${TITLE}"

IFS=',' # delimiter for read

stdbuf -oL yt-dlp \
	--quiet \
	--progress --newline --progress-template "%(progress._percent_str)s,%(progress.speed)s,%(progress.total_bytes)s" \
	--no-colors \
	"$@" \
	| stdbuf -i0 -oL awk '{ printf "%02d,%.1f MB/s,%d MB\n", $1, $2/1000000, $3/1000000 }' FS="," \
	| while read PERC SPEED SIZE; do 
	notify-send "Download ${PERC}% at ${SPEED} of ${SIZE}" "$TITLE" -r "$ID" -h "int:value:${PERC}" -t 0
done

$HOME/scripts/notify-id.sh unlock "$ID"
