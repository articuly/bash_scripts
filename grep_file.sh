hdfs dfs -ls -R /tmp/tt >temp1.txt
hdfs dfs -ls -R /tmp/tt/test1 >temp2.txt
grep -v -f temp2.txt temp1.txt
