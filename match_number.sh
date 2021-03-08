if grep -v '^[[:digit:]]*$' <<<"$1" 1>/dev/null; then
  echo "not a number"
else
  echo "is a number"
fi
