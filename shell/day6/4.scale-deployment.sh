#!/bin/bash
DEPLOYMENT=$1
REPLICAS=$2
NAMESPACE=$3
if [ -z "$DEPLOYMENT" ] || [ -z "$REPLICAS" ] || [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <deployment> <replicas> <namespace>"
  exit 1
fi
kubectl scale deployment "$DEPLOYMENT" --replicas="$REPLICAS" -n "$NAMESPACE"