#! /bin/bash
# Description: This script is a general server admin script that takes an administrato's input and carry out some administrative tasks
# Date Created: 03-MAY-2025
# Date Modified: 09-MAY-2025

echo
echo "Choose from any of the option as seen: 1 === Add User, 2 === Show System Info, 3 === Quit"
echo
read -p "Enter any choice from the above:" response
do
if [ $response -eq 1 ];
then
	read -p "Enter your chosen username:" username
	output="$(grep -w $username /etc/passwd)"
	if [ -n "$output" ];
	then
		echo " The user already exist"
	else
		sudo useradd "$username"
		if [ $? -eq 0 ];
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
	echo "===== System Information ====="
	# OS and Kernel
	echo "Operating System: $(uname -o)"
	echo "Kernel Version: $(uname -r)"
	echo "Architecture: $(uname -m)"
	# CPU Info
	echo "CPU Info:"
	lscpu | grep -E '^Model name|^CPU\(s\):|^Architecture' 2>/dev/null

	# Memory Info
	echo "Memory Info:"
	free -h

	# Disk Usage
	echo "Disk Usage:"
	df -h /    # root partition

	# Uptime
	echo "System Uptime: $(uptime -p)"

	# Logged in Users
	echo "Logged-in Users:"
	who

	echo "=============================="
fi
done