#!/bin/bash

if [[ -f {{ target_dir }}/milleniumdb.pid ]]
then
    echo $(date --iso-8601) - milleniumdb seems to be already running
    echo If it is not running remove milleniumdb.pid
    exit 1
fi

echo $(date --iso-8601) - Starting milleniumdb

{{ target_dir }}/systems/milleniumdb/server_sparql -t {{ query_timeout_s }} {{ target_dir }}/databases/milleniumdb/{{ item[1].name }}/ </dev/null 2>&1 >{{ target_dir }}/logs/run/milleniumdb-{{ item[1].name }}.log & disown
pid=$!

echo $pid > {{ target_dir }}/milleniumdb.pid

echo $(date --iso-8601) - Waiting for milleniumdb to become available

while :
do
    curl -s 127.0.0.1:8080
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - milleniumdb started and accepting connections
