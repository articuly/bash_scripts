# get total hdfs size, usage rates less than 1% are shown as 0%
hdfs_total_size=$(hdfs dfs -df | sed -n '2p' | awk '{print $2}')

# calculated usage rate and get display size
hdfs_path_size=$(hdfs dfs -du -s "$1" | awk '{print $2}')

if grep '^[[:digit:]]*$' <<<"$hdfs_path_size" 1>/dev/null; then
  size_display1=$(hdfs dfs -du -s -h "$1" | awk '{print $1}')
  # first col size equal 0
  if [ "$size_display1" -eq 0 ] 2>/dev/null; then
    hdfs_path_size_display=0
    hdfs_path_usage=0%
  # first col size less than 1k
  elif [ "$size_display1" -gt 0 ] 2>/dev/null; then
    size_display2=$(hdfs dfs -du -s -h "$1" | awk '{print $2}')
    # second col size less than 1k
    if [ "$size_display2" -gt 0 ] 2>/dev/null; then
      hdfs_path_size_display=${size_display2}B
      hdfs_path_usage=0%
    # second col size greater than 1k
    else
      hdfs_path_size_display=$(hdfs dfs -du -s -h "$1" | awk '{print $2,$3}')B
      hdfs_path_usage=0%
    fi
  # first col size greater than 1k, display a float number
  else
    hdfs_path_size_display=$(hdfs dfs -du -s -h "$1" | awk '{print $3,$4}')B
    hdfs_path_usage=$(echo "scale=$USAGE_SCALE; $hdfs_path_size/$hdfs_total_size*100" | bc)
    if [[ "$hdfs_path_usage" =~ ^\..* ]]; then
      hdfs_path_usage=0${hdfs_path_usage%??}% # for less than 1%
    else
      hdfs_path_usage=${hdfs_path_usage%??}% # for greater than 1%
    fi
  fi
  echo "<tr><td>$1</td><td>$hdfs_path_usage</td><td>$hdfs_path_size_display</td></tr>" >>housekeeping_usage.html
fi
