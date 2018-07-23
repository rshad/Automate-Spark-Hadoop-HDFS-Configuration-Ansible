#!/bin/sh

declare -a masters_directories=("/opt/hadoop/logs/" "/home/hadoop/datanode/" "/home/hadoop/namenode/" "/tmp/hadoop-hadoop/dfs/name/" "/tmp/hadoop-hadoop/dfs/namesecondary/" )

echo "Deleting files in the following directories in [masters] ..."
for directory in ${masters_directories[@]}
do
     echo "=>" $directory
     rm -rf $directory*
done

echo "Deleting HDFS and YARN processes ... "
for pid in $(ps -fe | grep '[p]rocess' | grep -v grep | awk '{print $2}'); do
    echo "Killing $pid ..."
    kill "$pid"
    echo "Sleeping 10 seconds"
    sleep 10
done
