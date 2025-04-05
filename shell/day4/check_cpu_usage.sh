#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}') # User + system usage

echo "Current CPU Usage: $cpu_usage%"

if (($(echo "$cpu_usage < 40.0" | bc -l))); then
  echo " CPU usage is low. System is healthy."
elif (($(echo "$cpu_usage >= 40.0" | bc -l))) && (($(echo "$cpu_usage < 75.0" | bc -l))); then
  echo " CPU usage is moderate. Monitor the processes."
else
  echo " High CPU usage detected! Consider checking running processes."
fi
