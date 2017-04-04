#!/bin/bash

DATE=$(date "+%Y-%m-%d-%H:%M:%S")
BAK_FILE="/home/ubuntu/db_backup_to_s3/redash_$DATE.sql"

bucket=$1

# Dump the whole database into a SQL file and compress it.
echo "Creating the backup file"
sudo -u postgres pg_dumpall > $BAK_FILE


aws s3 mv $BAK_FILE s3://$bucket/staging/backups/ --storage-class REDUCED_REDUNDANCY



