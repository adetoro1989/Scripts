#!/bin/bash

# Check if the user provided a directory path
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIR="$1"

# Calculate size
SIZE=$(du -sh "$DIR" | cut -f1)

echo "Size of '$DIR': $SIZE"