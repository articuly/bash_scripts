count=12
if [ $count -eq 0 ] 2>/dev/null; then
  echo "equal 0"
elif [ $count -gt 0 ] 2>/dev/null; then
  echo "greater than 0"
else
  echo "other"
fi
