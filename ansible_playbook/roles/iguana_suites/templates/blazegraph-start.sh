#!/bin/bash

if [[ -f {{ target_dir }}/blazegraph.pid ]]
then
    echo $(date --iso-8601) - Blazegraph seems to be already running
    echo If it is not running remove blazegraph.pid
    exit 1
fi

echo $(date --iso-8601) - Starting Blazegraph

cd {{ target_dir }}/databases/blazegraph/{{ item[1].name }}
java -XX:+UseG1GC -Xmx{{ (system_memory * 0.5) | int }}K -Djetty.overrideWebXml={{ target_dir }}/systems/blazegraph/override_timeout_web.xml -jar {{ target_dir }}/systems/blazegraph/blazegraph.jar 9999 {{ item[1].name }} {{ target_dir }}/systems/application.properties </dev/null 2>&1 >{{ target_dir }}/logs/run/blazegraph-{{ item[1].name }}-{{ item[2].number }}.log & disown
pid=$!

echo $pid > {{ target_dir }}/blazegraph.pid

echo $(date --iso-8601) - Waiting for Blazegraph to become available

while :
do
    curl -s 127.0.0.1:9999
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - Blazegraph started and accepting connections