#! /bin/bash
# Description: This script is a script that installs webserver on an EC2 instance at boot up. It is passed as an EC2 user data to be loaded on first spin up
# Date Created: 27-MAY-2025
# Date Modified: 27-MAY-2025

echo

echo "Install and configure a webserver at first spin up of the an EC2 machine"

sudo apt install update -y
sudo apt install apache2
systemctl start apache2
systemctl enable apache2