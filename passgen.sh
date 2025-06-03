#! /bin/bash
# Description: This script is a script that generates password
# Date Created: 06-JUNE-2025
# Date Modified: 06-JUNE-2025

echo "The script will generate password in linux"

password_gen=$(head -c 16 /dev/urandom | base64 |tr -dc 'a-zA-Z0-9!@#$%&')

echo "Your new password is: $password_gen"
