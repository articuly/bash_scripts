filename=file1.log
cat $filename | while read line; do #逐行读取字符串
  new_str=$(echo $line)                #我处理的方式为以空格分割字符串 取第一个
  echo -e $new_str >>new_Tsinghua.test #写入到新的文本中 并自动换行
done
