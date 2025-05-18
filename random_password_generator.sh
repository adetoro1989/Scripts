#!/bin/bash

# Check if the user provided a length
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 length"
    exit 1
fi

LENGTH="$1"

# Generate a random password
PASSWORD=$(< /dev/urandom tr -dc 'A-Za-z0-9!@#$%&' | head -c "$LENGTH")

echo "Generated Password: $PASSWORD"