#! /bin/bash

if [[ ! -f {{ target_dir }}/tentris.pid ]]
then
    echo $(date --iso-8601) - Tentris is not running
    exit 1
fi

kill -2 $(cat {{ target_dir }}/tentris.pid) >/dev/null
sleep 20
# kill -2 $(cat {{ target_dir }}/tentris.pid) >/dev/null

rm {{ target_dir }}/tentris.pid
