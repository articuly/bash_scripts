if ! hadoop fs -test -e /tmp/tt/test1; then
  echo 'not exist'
else
  echo 'exist'
fi
