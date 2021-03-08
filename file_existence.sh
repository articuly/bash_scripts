path=$1

# -d 参数判断 $folder 是否存在
if [ ! -d "$path/.retained" ]; then
  echo "$path no exits, can be cleaned"
fi

# -f 参数判断 $file 是否存在
if [ ! -f "$path/.retained" ]; then
  echo "$path no exits, can be cleaned"
fi
