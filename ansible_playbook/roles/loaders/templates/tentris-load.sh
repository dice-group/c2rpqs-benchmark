#! /bin/bash

{{ target_dir }}/systems/tentris/{{ item[0] }}/tentris_loader -s {{ target_dir }}/databases/tentris/{{ item[1].name }}/ --logfile false --logstdout -f {{ item[1].path }} << EOF 2>&1 | tee {{ target_dir }}/logs/load/tentris-{{ item[0] }}-{{ item[1].name }}.log

EOF
