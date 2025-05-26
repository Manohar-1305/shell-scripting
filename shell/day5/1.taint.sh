#!/bin/bash
# Get all nodes except those with 'master' in the name
nodes=($(kubectl get nodes --no-headers -o custom-columns=":metadata.name" | grep -v "master"))
taint_key="nodeproblem"
taint_value="Jira-1234"
taint_effect="NoSchedule"
for node in "${nodes[@]}"; do
  echo "Tainting $node..."
  kubectl taint nodes "$node" "$taint_key=$taint_value:$taint_effect" --overwrite
done
echo "All non-master nodes tainted with $taint_key=$taint_value:$taint_effect"