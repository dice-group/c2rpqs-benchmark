#!/bin/bash
triplestores=( "tentris-paths-full-min-card" "fuseki" "virtuoso" "graphdb" "blazegraph" "milleniumdb" )
workers=( 1 )
echo "SPARQL benchmark"
echo "Running Query Mixes suites for WDBench"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting $ts"
	./iguana_suites/http/"$ts"/wdbench/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for $ts"
	./iguana-run.sh ./iguana_suites/http/"$ts"/wdbench/1-c2rpqs-final-QM.yml &> /dev/null
	echo "$(date): Stopping $ts"
	./iguana_suites/http/"$ts"/stop.sh &> /dev/null
done
