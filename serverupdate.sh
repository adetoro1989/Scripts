#! /bin/bash
# Description: This script i to keep my server up to date regularly and keep alog of the update details on a daily basis into a log file
# Date Created: 03-MAY-2025
# Date Modified: 09-MAY-2025

y=$(date +"%Y-%m-%d %H:%M:%S.%3N")
echo
sudo apt update && sudo apt upgrade -y >> /ubuntu/project/scripts/update.log
echo
echo "System updated successfully!" >> /ubuntu/project/scripts/update.log
echo
echo "See details of Update ran today: $y" >> /ubuntu/project/scripts/update.log
echo
cat update.log