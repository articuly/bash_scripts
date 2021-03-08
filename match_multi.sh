ip=/fd
if [[ "$ip" =~ ^([/ab*|/cd*]) ]]; then
  echo 'match'
else
  echo "nothing"
fi
