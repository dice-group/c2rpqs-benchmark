#! /bin/bash

if [[ ! -f {{ target_dir }}/graphdb.pid ]]
then
    echo $(date --iso-8601) - GraphDB is not running
    exit 1
fi

kill $(cat {{ target_dir }}/graphdb.pid) >/dev/null
sleep 10
kill -9 $(cat {{ target_dir }}/graphdb.pid) >/dev/null

rm {{ target_dir }}/graphdb.pid