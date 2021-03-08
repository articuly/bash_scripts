subdir_count=$(hdfs dfs -count "/tmp/tt")
echo "$subdir_count"

sub_count_array=($subdir_count)
echo "${sub_count_array[1]}"
echo ${sub_count_array[2]}
