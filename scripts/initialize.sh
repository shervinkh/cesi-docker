#!/bin/bash

mkdir -p /var/log/supervisor

[ -e /data/cesi.db ] || sqlite3 /data/cesi.db < /app/userinfo.sql

truncate /etc/cesi.conf --size 0
nodes=$(echo ${NODES} | tr "," "\n")
for node in $nodes
do
cat >> /etc/cesi.conf <<EOF
[node:${node}]
username =
password =
host = ${node}
port = 9001

EOF
done

[ -n ${NODES} ] && cat >> /etc/cesi.conf <<EOF
[environment:server]
members = ${NODES}

EOF

cat >> /etc/cesi.conf <<EOF
[cesi]
database = /data/cesi.db
activity_log = /var/log/supervisor/cesi_activity.log
host = 0.0.0.0

EOF
