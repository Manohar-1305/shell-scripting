#!/bin/bash
NAMESPACE=$1
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi
kubectl top pods -n "$NAMESPACE"