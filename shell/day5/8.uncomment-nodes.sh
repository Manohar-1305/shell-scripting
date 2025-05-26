#!/bin/bash

file_path="./file.txt"

ips_to_uncomment=(
  "192.168.0.10"
  "192.168.0.12"
  "192.168.0.25"
  "192.168.0.28"
  "192.168.0.31"
)

echo "Uncommenting the following IPs in $file_path:"

for ip in "${ips_to_uncomment[@]}"; do
  # Uncomment lines that start with the IP and are commented
  sed -i "/^#$ip/s/^#//" "$file_path"

  # Show the uncommented line (for confirmation)
  grep "^$ip" "$file_path"
done

echo "✅ Specified IPs have been uncommented and displayed above."