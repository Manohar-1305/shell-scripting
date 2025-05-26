#!/bin/bash
nodes=($(kubectl get nodes --no-headers -o custom-columns=":metadata.name" | grep -v "control-plane"))
for node in "${nodes[@]}"; do
  echo "Adding label to $node..."
  kubectl label node "$node" mcp.k8s/prod=hyd --overwrite
done
echo "All non-master nodes labeled with mcp.k8s/prod=hyd."