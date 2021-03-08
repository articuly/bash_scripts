(
  echo "From: articuly@qq.com"
  echo "To: articuly@qq.com"
  echo "Subject: Hadoop housekeeping Module executed on $(date +'%Y-%m-%d') (Alert)"
  echo "Content-Type: text/plain; charset="utf-8""
  echo "MIME-Version: 1.0"
  echo "Content-Transfer-Encoding: base64"
  base64 mail.sh
) | sendmail -t
