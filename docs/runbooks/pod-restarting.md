# Runbook: PodRestartingRepeatedly

**Severity:** warning

1. `kubectl get pods -A | grep -v Running`
2. `kubectl describe pod <pod> -n <namespace>` (look at Last State and Reason, such as OOMKilled or Error)
3. `kubectl logs <pod> -n <namespace> --previous` (logs from before the crash)
4. OOMKilled: raise the memory limit. Error: read the logs and fix the configuration.
5. Escalate if production traffic is affected.
