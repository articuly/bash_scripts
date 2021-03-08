LINE="test"
while read -r path days; do
  echo "son: ${path} ${days}"
done <file1
echo "father: ${LINE}"
