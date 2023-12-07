#!/bin/bash

case "$1" in
    "up")
		light -A 10
        ;;
    "down")
		light -U 10
        ;;
    "get")
		echo "$(light -G)"
        ;;
    *)
        echo "Error: Invalid argument. Usage: $0 [up|down|get]"
        exit 1
        ;;
esac

