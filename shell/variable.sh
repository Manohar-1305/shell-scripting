#!/bin/bash

current_time=$(date +"%T")
current_user=$(whoami)
system_uptime=$(uptime -p)

echo "Current Time: $current_time"
echo "------------------------------"
echo "Logged in User: $current_user"
echo "------------------------------"
echo "System Uptime: $system_uptime"
