#!/bin/bash

echo "System Information"
echo "=================="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Current User: $(whoami)"
echo "Disk Usage:"
df -h
echo "Memory Usage:"
free -h