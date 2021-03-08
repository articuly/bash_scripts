var1=$(hdfs dfs -rm /tmp/tt/test1/avgmileage.csv 2>&1)
echo "$var1"

var2=$(hdfs dfs -rm -skipTrash /tmp/tt/test1/drivermileage.csv 2>&1)
echo "$var2"

var3=$(hdfs dfs -rm -r /app-logs 2>&1)
echo "$var3"

var4=$(hdfs dfs -rm -r /tmp/tt/test5 2>&1)
echo "$var4"
