#!/bin/sh

# provides unique notification ids for scripts to lock/unlock

TMP=/tmp/notify-id

case "$1" in
	lock)
		mkdir -p "$TMP"
		i=9000
		# mkdir is atomic => used for locking, no race conditions
		while ! mkdir "$TMP/$i" > /dev/null 2>&1; do
			i=$((i+1))
		done
		echo "$i"
		;;
	unlock)
		rmdir "$TMP/$2"
		;;
esac

