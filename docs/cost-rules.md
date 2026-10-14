# Cost rules for this project
1. Every resource group and resource has owner, env and project tags.
2. A budget alert exists on the subscription (50 / 80 / 100 percent, plus forecast).
3. The AKS cluster stops every night (scheduled pipeline) and is destroyed when a project ends.
4. Side resource groups (rg-keyvault, rg-ansible) are deleted after use.
5. Check Cost analysis and Advisor at the start of each session.
## What costs money when idle
- AKS nodes (virtual machines): the biggest item, so stop or destroy them.
- Public IPs and load balancers: small hourly cost, even when stopped.
- Disks (PVCs): cost until deleted.
- Container registry (Basic): a small daily fee.
- Key Vault and storage: pennies.
