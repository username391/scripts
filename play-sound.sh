#!/bin/bash

notification_summary="$2"

if [[ "$notification_summary" == *"Download"* ]]; then
    exit 0
fi

paplay ~/scripts/src/notification-0.wav

