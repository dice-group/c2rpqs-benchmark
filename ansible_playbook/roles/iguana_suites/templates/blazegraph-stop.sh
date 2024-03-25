#! /bin/bash

if [[ ! -f {{ target_dir }}/blazegraph.pid ]]
then
    echo $(date --iso-8601) - Blazegraph is not running
    exit 1
fi

kill $(cat {{ target_dir }}/blazegraph.pid) >/dev/null
sleep 10
kill -9 $(cat {{ target_dir }}/blazegraph.pid) >/dev/null

rm {{ target_dir }}/blazegraph.pid