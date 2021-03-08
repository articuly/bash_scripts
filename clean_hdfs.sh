#!/bin/bash
source ~/.bashrc

# HADOOP所在的bin目录
# HADOOP_BIN_PATH=/home/hadoop/hadoop-2.3.0-cdh5.0.0/bin

#待检测的HDFS目录
data1_file=/tmp/test1
data2_file=/tmp/test2
#将待检测的目录(可以为多个)加载至数组中
array_check=($data1_file $data2_file)

# 当前时间戳
today_timestamp=$(date -d "$(date +"%Y-%m-%d %H:%M")" +%s)

#Func: 删除指定时间之前的过期，这里设置的是45天前
removeOutDate() {
  hdfs dfs -ls -r $1 >temp.txt
  cat temp.txt | while read quanxian temp user group size day hour filepath; do
    current_file_time="$day $hour"
    current_file_timestamp=$(date -d "$current_file_time" +%s)
    if [ $(($today_timestamp - $current_file_timestamp)) -ge $((60)) ]; then
      echo "$(date +'%Y-%m-%d %H:%M:%S') $filepath"
      hdfs dfs -rm -r $filepath >/dev/null 2>&1
    fi
  done
}

#Func: 执行删除
execute() {
  echo -e "\n\n"
  echo "$(date +'%Y-%m-%d %H:%M:%S') start to remove outdate files in hdfs"
  echo "$(date +'%Y-%m-%d %H:%M:%S') today is: $(date +"%Y-%m-%d %H:%M:%S")"

  for i in ${array_check[@]}; do
    echo "$(date +'%Y-%m-%d %H:%M:%S') processing filepath: $i"
    removeOutDate $i
    echo -e "\n"
  done

  echo "$(date +'%Y-%m-%d %H:%M:%S') remove outdate files in hdfs finished"
  echo -e "\n\n"
}

# 开始执行
execute
