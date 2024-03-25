#! /bin/bash

if [[ ! -f {{ target_dir }}/milleniumdb.pid ]]
then
    echo $(date --iso-8601) - milleniumdb is not running
    exit 1
fi

kill -2 $(cat {{ target_dir }}/milleniumdb.pid) >/dev/null
sleep 20
# kill -2 $(cat {{ target_dir }}/milleniumdb.pid) >/dev/null

rm {{ target_dir }}/milleniumdb.pid
