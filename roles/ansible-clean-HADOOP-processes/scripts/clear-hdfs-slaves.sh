#!/bin/sh

declare -a slaves_directories=("/opt/hadoop/logs/" "/home/fedora/datanode/" "/home/fedora/namenode/" "/tmp/hadoop-fedora/*" "/tmp/hadoop*" "/tmp/spark-events")

echo "Deleting files in the following directories in [slaves] ..."
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

