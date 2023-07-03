#!/bin/bash

reg=$(pmm-admin add proxysql --username=$PMM_AGENT_PROXYSQL_USERNAME --password=$PMM_AGENT_PROXYSQL_PASSWORD)
if [[ $reg -ge 1 ]];
then
  echo "Update Success"
  exit 0
else
  echo "Update Failure: $reg"
  exit 0
fi