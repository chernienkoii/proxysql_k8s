#!/bin/bash
set -e

mbin="/usr/bin/mysql"
lcon="-h127.0.0.1 -P6032 -uadmin -padmin"
opts="-NB"

hg1_avail=$($mbin $lcon $opts -e"select count(*) from runtime_mysql_servers where hostgroup_id = 1")

if [[ $hg1_avail -ge 1 ]];
then
  echo "HG1 Availability Success"
  exit 0
else
  echo "HG1 Availability Failure - MySQL backends found: $hg1_avail"
  exit 0
fi
