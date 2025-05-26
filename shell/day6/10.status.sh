#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Usage: $0 <deployment> <namespace> <replicas>"
  exit 1
fi

kubectl scale deployment "$1" --replicas="$3" -n "$2"
