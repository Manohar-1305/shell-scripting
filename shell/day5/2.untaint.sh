#!/bin/bash
nodes=($(kubectl get nodes --no-headers -o custom-columns=":metadata.name" | grep -v "control-plane"))
taint_key="nodeproblem"
for node in "${nodes[@]}"; do
  echo "Removing taint from $node..."
  kubectl taint nodes "$node" "$taint_key-" --overwrite
  if [ $? -eq 0 ]; then
    echo "Taint removed from $node"
  else
    echo "Failed to remove taint from $node"
  fi
done
echo "All specified nodes have had their taints removed."