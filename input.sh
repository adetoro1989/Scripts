#! /bin/bash
# Description: This script is a general server admin script that takes an administrato's input and carry out some administrative tasks
# Date Created: 03-MAY-2025
# Date Modified: 09-MAY-2025

echo
echo "Choose from any of the option as seen: 1 === Add User, 2 === Show System Info, 3 === Quit"
echo
while true; do
read -p "Enter any choice from the above:" response

#hile [[ "$response" == "1" ]] || [[ "$response" == "2" ]] || [[ "$response" == "3" ]]; do
if [ $response -eq 1 ];
then
	read -p "Enter your chosen username:" username
	output="$(grep -w $username /etc/passwd)"
	if [ -n "$output" ]; # Check if Output initially declared above isnt empty
	then
		echo " The user already exist"
	else
		sudo useradd "$username"
		if [ $? -eq 0 ]; # Check if previous command ran successfully
		then
			echo "The user was added successfully"
			tail -n 1 /etc/passwd
		else
			echo "there was an error adding $username"
		fi
	fi
fi

if [ $response -eq 2 ];
then
    echo "===== System Information ======="
    echo "Operating System: $(uname -o)"
    echo "$(uname -r)"
    echo "Disk Usage Info: $(df -h)"
    echo "$(du -h)"
fi  

if [ $response -eq 3 ];
then
    echo "Exiting Script"
    exit
fi
done