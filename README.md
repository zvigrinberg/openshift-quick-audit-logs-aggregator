# openshift-quick-audit-logs-aggregator
A Lightweight and very quick version of oc adm must-gather command, to gather kube-apiserver logs from all master nodes.

## Procedure
1. Connect to cluster
2. Run the script
```shell
./openshift-audit-logs-aggregator.sh
```
3. When finishes, you can filter jsons returned according to records' field value
```shell
 cat all_audits.txt | jq 'select(.verb == "delete")' > all_audits_delete.json
```
