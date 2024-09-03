#!/bin/bash 

COUNTER=0
NODE_NAME=""
LOG_NAME=""
 
for I in $(oc adm node-logs --role=master --path=openshift-apiserver/)
do 
    if [ $((COUNTER%2)) -eq 0 ];
    then
      NODE_NAME=$I
    else
      LOG_NAME=$I
    fi
    COUNTER=$((COUNTER+1))
    if [[ -n $NODE_NAME ]] &&  [[ -n $LOG_NAME ]];
    then
      echo "About to collect log ${LOG_NAME} for node ${NODE_NAME}"
      oc adm node-logs ${NODE_NAME} --path=kube-apiserver/${LOG_NAME} >> ./all_audits.txt
      NODE_NAME=""
      LOG_NAME=""
    fi
done
