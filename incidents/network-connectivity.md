# Incident 02: Network Connectivity Failure and Recovery

## 1. Incident Summary
A controlled network connectivity issue was simulated in a local Kubernetes environment using Minikube.

## 2. Environment
- Platform: Kubernetes
- Cluster: Minikube
- Test Pod: `network-test`
- Kubernetes Service: `network-test-svc`
- Namespace: `default`
- Service Type: ClusterIP

## 3. Initial Connectivity Verification
The NGINX test pod was running successfully. A temporary BusyBox client accessed the service and received the NGINX welcome page, confirming that connectivity was working before the simulation.

## 4. Failure Simulation
The Service selector was temporarily changed so that it no longer matched the test pod.

Command:
`kubectl patch service network-test-svc -p "{\"spec\":{\"selector\":{\"run\":\"network-test-failure\"}}}"`

## 5. Observed Impact
The Service had no matching backend endpoints.

Verification command:
`kubectl get endpoints network-test-svc`

Observed result:
`ENDPOINTS: <none>`

The test demonstrated how an incorrect Service selector can interrupt access to a healthy application pod.

## 6. Root Cause
The Kubernetes Service selector did not match the labels on the test pod. Consequently, Kubernetes could not associate the Service with a backend endpoint.

## 7. Recovery Procedure
The original selector was restored.

Command:
`kubectl patch service network-test-svc -p "{\"spec\":{\"selector\":{\"run\":\"network-test\"}}}"`

The Service endpoints were checked again, and the test pod IP with port 80 reappeared.

## 8. Preventive Measures
- Verify Service selectors against pod labels.
- Check Service endpoints when troubleshooting connectivity.
- Test connectivity from a client pod.
- Validate Service configuration after changes.

## 9. Result
The network failure was reproduced in an isolated test Service and successfully recovered by restoring the correct selector. Existing application deployments were not modified.
