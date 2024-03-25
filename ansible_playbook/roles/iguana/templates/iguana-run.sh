#! /bin/sh

java -Xmx{{ iguana_mem }} -jar {{ target_dir }}/iguana-{{ iguana_version }}/corecontroller.jar  $1
