#!/bin/bash
log_file="kubernetes_folder_deletion.txt"

# Correct list of containers to execute the command on
containers=(
  "multi-node-cluster-worker"
  "multi-node-cluster-worker2"
  "multi-node-cluster-worker3"
  "multi-node-cluster-worker4"
  "multi-node-cluster-worker5"
)

# Loop through each container and run the docker exec command
for container in "${containers[@]}"; do
  echo "Connecting to container $container..."

  # Run the delete command inside the container
  docker exec -it "$container" bash -c "rm -rf /etc/kubernetes"
  docker_status=$?

  # Check if the delete command was successful
  if [ $docker_status -eq 0 ]; then
    echo "Successfully deleted /etc/kubernetes in $container" >> "$log_file"
  else
    echo "Failed to delete /etc/kubernetes in $container" >> "$log_file"
  fi

  # Drain the node before deleting it from the cluster
  kubectl drain "$container" --ignore-daemonsets
  drain_status=$?
  
  if [ $drain_status -eq 0 ]; then
    echo "Successfully drained $container" >> "$log_file"
  else
    echo "Failed to drain $container" >> "$log_file"
  fi

  # Delete the node from the cluster
  kubectl delete node "$container"
  delete_status=$?
  
  if [ $delete_status -eq 0 ]; then
    echo "Successfully deleted $container from the cluster" >> "$log_file"
  else
    echo "Failed to delete $container from the cluster" >> "$log_file"
  fi
done

echo "Operations completed. Check the log file kubernetes_folder_deletion.txt for details."