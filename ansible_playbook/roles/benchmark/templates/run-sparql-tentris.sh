#!/bin/bash
triplestores=( "paths-full-rf" "paths-rpq-prio-no-cache" "paths-rpq-prio-cache" "paths-join-prio" )
workers=( 1 )
echo "SPARQL benchmark (Tentris versions)"
echo "Running Query Mixes suites for WDBench"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting tentris-$ts"
	./iguana_suites/http/tentris-"$ts"/wdbench/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for tentris-$ts"
	./iguana-run.sh ./iguana_suites/http/tentris-"$ts"/wdbench/1-c2rpqs-final-QM.yml &> /dev/null
	echo "$(date): Stopping tentris-$ts"
	./iguana_suites/http/tentris-"$ts"/stop.sh &> /dev/null
done
