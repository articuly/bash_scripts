while IFS=$'\t' read -r path kept_days removed_content; do
  echo "$(date +'%Y-%m-%d %H:%M:%S') Processing path: $path, kept days: $kept_days, $removed_content will be removed."
  echo "$path $kept_days $removed_content"
  echo "$(date +'%Y-%m-%d %H:%M:%S') Remove expired files in $path finished."
done <specific_path.conf
