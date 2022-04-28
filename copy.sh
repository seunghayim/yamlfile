#!/bin/bash
cp /var/log/nginx/access.log /var/log/nginx/backup/backup.`date +%Y%m%d%H%M%S` 
cat /dev/null > /var/log/nginx/access.log