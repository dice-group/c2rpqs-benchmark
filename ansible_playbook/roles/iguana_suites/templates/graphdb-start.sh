#!/bin/bash

if [[ -f {{ target_dir }}/graphdb.pid ]]
then
    echo $(date --iso-8601) - GraphDB seems to be already running
    echo If it is not running remove graphdb.pid
    exit 1
fi

echo $(date --iso-8601) - Starting GraphDB

export GDB_HEAP_SIZE={{ (item[1].max_ram * 0.66) | int }}K

{{ target_dir }}/systems/graphdb/graphdb-{{ graphdb_version }}/bin/graphdb -d -p {{ target_dir }}/graphdb.pid -s -Dgraphdb.home={{ target_dir }}/databases/graphdb/{{ item[1].name }}

echo $(date --iso-8601) - Waiting for GraphDB to become available

while :
do
    curl -s 127.0.0.1:7200
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

sleep 60s

echo $(date --iso-8601) - GraphDB started and accepting connections