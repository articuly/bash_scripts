ARR=(all files)

if grep -v -w "file" <<<"${ARR[@]}" 1>/dev/null; then
  echo "keyword not in array"
else
  echo "keyword in array"
fi
