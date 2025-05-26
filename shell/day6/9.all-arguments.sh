#!/bin/bash

set -- "$@" # just to be clear, but it's the same

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <deployment> <namespace>"
  exit 1
fi

kubectl rollout status deployment/"$1" -n "$2"
