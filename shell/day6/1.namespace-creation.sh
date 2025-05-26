#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi

NAMESPACE=$1

if kubectl get namespace "$NAMESPACE" >/dev/null 2>&1; then
  echo "Namespace '$NAMESPACE' already exists."
else

  kubectl create namespace "$NAMESPACE"
  echo "Namespace '$NAMESPACE' created."
fi
