#!/bin/bash

if [[ -f {{ target_dir }}/virtuoso.pid ]]
then
    echo $(date --iso-8601) - Virtuoso seems to be already running
    echo If it is not running remove virtuoso.pid
    exit 1
fi

echo $(date --iso-8601) - Starting Virtuoso

{{ target_dir }}/systems/virtuoso/{{ virtuoso_version }}/virtuoso-opensource/bin/virtuoso-t -c {{ target_dir }}/systems/virtuoso/virtuoso-run-{{ item[1].name }}-{{ item[2].number }}.ini

echo $(date --iso-8601) - Waiting for Virtuoso to become available

while :
do
    curl -s 127.0.0.1:8890
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - Virtuoso started and accepting connections

exit 0