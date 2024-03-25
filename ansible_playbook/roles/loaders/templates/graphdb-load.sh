#! /bin/bash

mkdir -p {{ target_dir }}/databases/graphdb/{{ item[1].name }}/data/

{{ target_dir }}/systems/graphdb/graphdb-{{ graphdb_version }}/bin/importrdf -Xmx{{ system_memory }}K -Dgraphdb.home.data={{ target_dir }}/databases/graphdb/{{ item[1].name }}/data/ preload -f -c {{ target_dir }}/systems/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/graphdb-{{ item[1].name }}.log