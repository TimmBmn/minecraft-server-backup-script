#!/bin/bash

set -a && source .env && set +a

# this is only the path where the backup is generated not where it ends up
backup_generation_path="/tmp/minecraft-server-backup"

# create folder if not exists
test -d $backup_generation_path || mkdir -p $backup_generation_path

# check if backup is ongoing
if [ -n "$( ls -A $backup_generation_path)" ]; then
   echo "already generating backup"
   echo "stopping this process"
   return -1
fi

# start sftp to copy all the files
sshpass -p $PASSWORD sftp -oPort=$PORT $USERNAME@$HOST <<EOF
get -R * $backup_generation_path
EOF


# create location if not exists
test -d $BACKUP_LOCATION || mkdir -p $BACKUP_LOCATION

# concat full backup filename w. path
backup_file="$BACKUP_LOCATION/$(date +"%F_%R").backup.zip"

# zip the backup
zip -r $backup_file $backup_generation_path

# delete the temporary data
rm -rf $backup_generation_path
