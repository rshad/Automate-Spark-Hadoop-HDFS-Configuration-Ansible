#!/bin/sh

declare -a masters_directories=("/opt/hadoop/logs/" "/home/hadoop/datanode/" "/home/hadoop/namenode/" "/tmp/hadoop-hadoop/")

echo "Deleting files in the following directories in [masters] ..."
for directory in ${masters_directories[@]}
do
     echo "=>" $directory
     rm -rf $directory*
done


