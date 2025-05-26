#!/bin/bash
NAMESPACE=$1  
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>" 
  exit 1
fi
kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running