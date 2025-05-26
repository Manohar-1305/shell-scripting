#!/bin/bash

nodes=($(kubectl get nodes --no-headers -o custom-columns=":metadata.name" | grep -v "control-plane"))

for node in "${nodes[@]}"; do
  echo "Cordoning $node..."
  kubectl cordon "$node"
  if [ $? -eq 0 ]; then
    echo "$node cordoned successfully."
  else
    echo "Failed to cordon $node."
  fi
done