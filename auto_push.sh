#!/data/data/com.termux/files/usr/bin/bash

cd ~/Live-node-tracker

# Log node heartbeat
if [ -f "event_flag.txt" ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') :: Event Triggered ⚡" >> node_log.txt
  rm event_flag.txt
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') :: Node Alive" >> node_log.txt
fi

# Encrypt node log
openssl enc -aes-256-cbc -pbkdf2 -salt -in node_log.txt -out node_log.enc -pass file:./key.txt

# Encrypt thought log
if [ -f thought_log.txt ]; then
  openssl enc -aes-256-cbc -pbkdf2 -salt -in thought_log.txt -out thought_log.enc -pass file:./key.txt
fi

# Git commit and push (token is now stored securely)
git add node_log.enc thought_log.enc
git commit -m "Encrypted logs updated: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
