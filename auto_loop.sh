#!/data/data/com.termux/files/usr/bin/bash

while true; do
  bash ~/Live-node-tracker/auto_push.sh
  sleep 600  # Wait 10 minutes before next push
done
