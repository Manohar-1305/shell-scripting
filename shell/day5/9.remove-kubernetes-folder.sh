#!/bin/bash
log_file="kubernetes_folder_deletion.txt"
ip_addresses=(
  "10.51.164.166"
  "10.52.1.1"
  "192.168.23.12"
)
for ip in "${ip_addresses[@]}"; do
  echo "Connecting to $ip..."
  ssh "ubuntu@$ip" "sudo rm -rf /etc/kubernetes"
  ssh_status=$?
  if [ $ssh_status -eq 0 ]; then
    echo "Deleted /etc/kubernetes on $ip" >> "$log_file"
  else
    echo "Unable to ssh or delete failed on $ip" >> "$log_file"
  fi
done