#! /bin/bash

{{ target_dir }}/systems/milleniumdb/create_db_sparql {{ item[1].path }} {{ target_dir }}/databases/milleniumdb/{{ item[1].name }}/ << EOF 2>&1 | tee {{ target_dir }}/logs/load/milleniumdb-{{ item[0] }}-{{ item[1].name }}.log

EOF