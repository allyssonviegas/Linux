#!/bin/bash
#
#
now=$(date +%F_%T)
#
#
###################################
### SET PERMISSION TO SSH KEYS ####
###################################
#
#
find /home/user/.ssh -type d -exec chown -R user:user /home/user/.ssh {} \;
find /home/user/.ssh -type d -exec chmod 700 {} \;
find /home/user/.ssh -type f -exec chmod 600 {} \;
find /home/user/.ssh/*.pub -exec chmod 644 {} \;
echo "SSH KEYS Permission OK: $now"  > /var/log/ssh-keys.log
find /var/log/ssh-keys.log -exec chown -R user:user /var/log/ssh-keys.log {} \;
find /var/log/ssh-keys.log -exec chmod 600 {} \;
#
#
# Setup:
# 1. Create a file at /etc/cron.d and add +x permission
# 2. sudo vim /etc/crontab
# 3. configure the job, i.e (* 1 * * * root /etc/cron.d/set-sshkeys-permission.sh)
# Set a cronjob to run the script
# Verification:
# /var/log/ssh-keys.log
# SSH KEYS Permission OK: 2025-02-17_21:27:01
