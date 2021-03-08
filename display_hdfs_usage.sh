path="/tmp/tt"
display=$(hdfs dfs -du -s -h "$path" | awk '{print $1}')

if [ "$display" -eq 0 ] 2>/dev/null; then
  hdfs_path_size_display=0
else
  hdfs_path_size_display=$(hdfs dfs -du -s -h "$path" | awk '{print $3,$4}')B
fi

echo "$hdfs_path_size_display"
