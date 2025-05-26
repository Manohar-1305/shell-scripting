#!/bin/bash
nodes=($(kubectl get nodes --no-headers -o custom-columns=":metadata.name" | grep -v "control-plane"))

for node in "${nodes[@]}"; do
  echo "Removing label from $node..."
  kubectl label node "$node" mcp.k8s/prod- --overwrite
done

echo " Label removed from selected nodes."
