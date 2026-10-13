# Runbook: UmpUnavailable

**Severity:** critical
**Alert:** no `ump` pods are available for 2 minutes.
**Impact:** the UMP service is down for users.

## 1. Check
- `kubectl get pods -n ump`
- `kubectl describe pod <pod> -n ump` (read the Events at the bottom)
- `kubectl logs <pod> -n ump`
- Grafana: Kubernetes / Compute Resources / Namespace (Pods), namespace `ump`
- Loki: `{namespace="ump"}`

## 2. Common causes and fixes
| Symptom | Likely cause | Fix |
|---|---|---|
| ImagePullBackOff | wrong tag or registry access | check the image tag in ACR, then `az aks check-acr` |
| ContainerCreating for a long time | Key Vault secret mount failing | check the role assignment and `kubectl describe pod` events |
| CrashLoopBackOff | bad config in the image | roll back the last change (below) |
| Pending | no node capacity | check `kubectl top nodes`, scale or free up resources |

## 3. Roll back
Revert the last commit in Git through a pull request. ArgoCD redeploys the previous version.

## 4. Escalate
If not fixed in 15 minutes, contact the service owner.

## 5. After the incident
Write down what happened and what will prevent it next time.
