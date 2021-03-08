hdfs dfs -ls -R "/tmp/tt/test2"

reg_exp=$(tr -t "\n" "|" <excluded_path.conf)
reg_exp=${reg_exp%?}
echo "$reg_exp"

hdfs dfs -ls -R "/tmp/tt/test2" >temp.txt
grep -E -w -v "$reg_exp" temp.txt
