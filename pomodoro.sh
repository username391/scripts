#!/bin/bash

if [ "$#" -eq 1 ]; then
    # Если передан аргумент в формате MM:SS, вычисляем количество секунд
    IFS=':' read -r minutes seconds <<< "$1"
    ((seconds = minutes * 60 + seconds))
else
    # Если аргумент не передан, устанавливаем 25 минут (1500 секунд)
    seconds=1500
fi


start="$(($(date +%s) + $seconds))"
while [ "$start" -ge `date +%s` ]; do
    time="$(( $start - `date +%s` ))"
    printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
done

while true; do
	mpv "~/scripts/src/done.mp3" --no-terminal
	wait $!
	sleep 0.1
done
