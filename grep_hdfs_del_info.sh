while IFS=$'\n' read -r info; do
  if grep -w -i 'permission denied' <<<"$info" 1>/dev/null; then
    echo "permission denied, fail to remove."
  elif grep -w -i 'deleted' <<<"$info" 1>/dev/null; then
    echo "has been deleted."
  elif grep -w -i 'to trash at' <<<"$info" 1>/dev/null; then
    echo "has removed to trash."
  else
    echo "fail to remove, please see the log."
  fi
done <del.log
