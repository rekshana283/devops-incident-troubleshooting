#!/bin/bash

# Kubernetes Incident Diagnostic Script

NAMESPACE="default"
DEPLOYMENT="devops-demo"

echo "=================================="
echo " Kubernetes Incident Diagnostics"
echo "=================================="

echo ""
echo "1. Checking Kubernetes cluster nodes..."
kubectl get nodes

echo ""
echo "2. Checking deployment status..."
kubectl get deployment "$DEPLOYMENT" -n "$NAMESPACE"

echo ""
echo "3. Checking pods..."
kubectl get pods -n "$NAMESPACE" -o wide

echo ""
echo "4. Checking recent events..."
kubectl get events -n "$NAMESPACE" \
  --sort-by=.lastTimestamp

echo ""
echo "5. Collecting application logs..."

POD=$(kubectl get pods -n "$NAMESPACE" \
  -l app="$DEPLOYMENT" \
  -o jsonpath='{.items[0].metadata.name}')

if [ -n "$POD" ]; then
    kubectl logs "$POD" -n "$NAMESPACE" --tail=50
else
    echo "No matching pod found. Check deployment and pod status."
fi

echo ""
echo "Diagnostics completed."
