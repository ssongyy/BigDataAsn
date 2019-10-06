#!/bin/sh
./start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /BigDataAsn/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /BigDataAsn/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /BigDataAsn/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /ssongyy/access.log.txt /BigDataAsn/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file /BigDataAsn/mapper1.py -mapper ./ssongyy/BigDataAsn/mapper1.py \
-file /BigDataAsn/reducer1.py -reducer ./ssongyy/BigDataAsn/reducer1.py \
-file /BigDataAsn/mapper2.py -mapper ./ssongyy/BigDataAsn/mapper2.py \
-file /BigDataAsn/reducer2 .py -reducer ./ssongyy/BigDataAsn/reducer2 .py \
-input /BigDataAsn/input/* -output /BigDataAsn/output/
/usr/local/hadoop/bin/hdfs dfs -cat /BigDataAsn/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /BigDataAsn/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /BigDataAsn/output/
./stop.sh
