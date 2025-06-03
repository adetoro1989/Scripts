#!/bin/bash

# Check if the user provided a directory path
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/directory /path/to/backup"
    exit 1
fi

SOURCE_DIR="$1"
BACKUP_DIR="$2"

# Create backup
tar -czf "${BACKUP_DIR}/backup_$(date +%Y%m%d).tar.gz" -C "$SOURCE_DIR" .

echo "Backup of '$SOURCE_DIR' created at '$BACKUP_DIR'."