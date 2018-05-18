#!/bin/sh

declare -a slaves_directories=("/opt/hadoop/logs/" "/home/hadoop/datanode/" "/tmp/hadoop-hadoop/")

echo "Deleting files in the following directories in [masters] ..."
for directory in ${slaves_directories[@]}
do
     echo "=>" $directory
     rm -rf $directory*
done

echo "Deleting HDFS and YARN processes ... "
for pid in $(ps -ef | grep hadoop | grep -v grep | awk '{print $2}'); do
    echo "Killing $pid ..."
    kill "$pid"
done
