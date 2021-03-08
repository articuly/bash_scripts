var=.000400

if [[ "$var" =~ ^\..* ]]; then
  echo 0$var
else
  echo no_match
fi
