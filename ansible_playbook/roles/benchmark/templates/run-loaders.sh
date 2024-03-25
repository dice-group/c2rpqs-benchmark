#!/bin/bash
datasets=( "wdbench" )
systems=( "fuseki" "virtuoso" "blazegraph" "graphdb" "tentris-paths-full-rf" )
for system in "${systems[@]}"
do
  for dataset in "${datasets[@]}"
  do
    bash {{ target_dir }}/loaders/"$system"-load-"$dataset".sh
  done
done
