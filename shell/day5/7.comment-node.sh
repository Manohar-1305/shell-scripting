#!/bin/bash

file_path="./file.txt"

ips_to_comment=(
  "192.168.0.10"
  "192.168.0.12"
  "192.168.0.25"
  "192.168.0.28"
  "192.168.0.31"
)

echo "Commenting the following IPs in $file_path:"

for ip in "${ips_to_comment[@]}"; do
  # Comment only lines that start with the IP and are not already commented
  sed -i "/^$ip/s/^/#/" "$file_path"

  # Show the commented line (for confirmation)
  grep "^#${ip}" "$file_path"
done

echo "✅ Specified IPs have been commented and displayed above."