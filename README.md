# DevOps Incident Troubleshooting and Recovery

## Overview
This project demonstrates practical incident troubleshooting and recovery in a local Kubernetes environment using Minikube. It includes controlled service downtime, network connectivity failure, diagnostic scripting, and incident documentation.

## Environment
- Kubernetes
- Minikube
- Docker
- NGINX
- Bash
- kubectl

## Incidents Covered

### 1. Service Downtime and Recovery
- Simulated service downtime by scaling the `devops-demo` deployment to zero replicas.
- Restored the deployment to two replicas.
- Verified pod status and deployment availability.
- Documented the incident, root cause, recovery, and preventive measures.

Documentation: `incidents/service-downtime.md`

### 2. Network Connectivity Failure and Recovery
- Created an isolated NGINX test pod and ClusterIP service.
- Verified connectivity using a temporary client pod.
- Simulated a connectivity failure by changing the Service selector.
- Confirmed that the Service had no endpoints.
- Restored the original selector and verified endpoint recovery.

Documentation: `incidents/network-connectivity.md`

### 3. Kubernetes Diagnostic Script
The Bash diagnostic script checks:
- Kubernetes node status
- Deployment status
- Pod status
- Recent cluster events
- Application logs

Script: `scripts/diagnose.sh`

## Diagnostic Output
The collected diagnostic output is available at:

`logs/diagnostic-output.txt`

## Metrics Server Investigation
The metrics-server was observed in a CrashLoopBackOff state. Health-probe failures and the `no metrics to serve` message were recorded. Node conditions showed no memory, disk, or PID pressure. The underlying trigger was not conclusively identified, so it remains documented as an unresolved finding.

## Key Learnings
- Investigating Kubernetes incidents using `kubectl`
- Identifying deployment and Service configuration issues
- Restoring service availability
- Collecting diagnostic output with Bash
- Documenting root causes, recovery steps, and preventive measures

## Conclusion
This project demonstrates controlled Kubernetes incident simulation, troubleshooting, recovery verification, and operational documentation in a local test environment.
