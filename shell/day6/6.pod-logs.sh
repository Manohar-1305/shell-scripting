#!/bin/bash
POD=$1
CONTAINER=$2
NAMESPACE=$3
if [ -z "$POD" ] || [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <pod> [container] <namespace>"
  exit 1
fi
if [ -z "$CONTAINER" ]; then
  kubectl logs "$POD" -n "$NAMESPACE"
else
  kubectl logs "$POD" -c "$CONTAINER" -n "$NAMESPACE"
fi