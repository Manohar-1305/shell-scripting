#!/bin/bash

# Get all non-control-plane nodes
nodes=($(kubectl get nodes --no-headers -o custom-columns=":metadata.name" | grep -v "control-plane"))

for node in "${nodes[@]}"; do
  schedulable=$(kubectl get node "$node" -o jsonpath='{.spec.unschedulable}' 2>/dev/null)

  if [[ "$schedulable" == "true" ]]; then
    echo "Uncordoning $node..."
    kubectl uncordon "$node"
  elif [[ "$schedulable" == "false" || -z "$schedulable" ]]; then
    echo "$node is already schedulable."
  else
    echo "Unable to determine schedulable status for $node"
  fi
done
