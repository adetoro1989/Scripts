#! /bin/bash

touch log_file.log

date >> log_file.log

free -h >> log_file.log

if [ $? -eq 0 ]; then
	echo "Command ran successfully"
else
	echo "Check your code"
fi
