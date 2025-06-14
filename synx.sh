#!/data/data/com.termux/files/usr/bin/bash

cd ~/Live-node-tracker

read -p "Synx Thought → " synx_input

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "$timestamp :: Synx: '$synx_input'" >> thought_log.txt

echo "[+] Thought logged."

# Encrypt the thought log
openssl enc -aes-256-cbc -pbkdf2 -salt -in thought_log.txt -out thought_log.enc -pass file:./key.txt

# Commit and push
git add thought_log.enc
git commit -m "Synx Thought Logged: $timestamp"
git push origin main
