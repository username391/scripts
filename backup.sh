#!/bin/bash

BACKUP_DIR="/run/media/me/BACKUP"
declare -A CONNECTIONS=(
    ["$HOME/wallpapers/"]="$BACKUP_DIR/02_pictures/wallpapers/"
    ["$HOME/accs.kdbx"]="$BACKUP_DIR/__backup/accs.kdbx"
    ["$HOME/work/"]="$BACKUP_DIR/__backup/work/"
    ["$HOME/projects/"]="$BACKUP_DIR/__backup/projects/"
)

IGNORED_ITEMS=(
	".git"
	"__pycache__"
	"work"
	"projects"
)

EXCLUDE=""
for item in "${IGNORED_ITEMS[@]}"; do
    EXCLUDE+=" --exclude=$item"
done

from_backup=false

while getopts ":f" opt; do
    case $opt in
        from-backup) from_backup=true ;;
        \?) echo "Неверный аргумент: -$OPTARG" >&2; exit 1 ;;
    esac
done

for key in "${!CONNECTIONS[@]}"; do
    value=${CONNECTIONS[$key]}
	echo "$key -> $value"
    if [ "$from_backup" = true ]; then
        rsync -avzh "$value" "$key"
    else
        # rsync -avzh --relative --rsync-path="cd \"$BACKUP_DIR\" && rsync" "$key" "$value"
		rsync -avzh $EXCLUDE $key $value
    fi
done

echo "Копирование завершено!"

