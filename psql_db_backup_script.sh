#!/bin/bash

DB_USER="your_database_user"
DB_PASSWORD="your_database_password"
DB_NAME="your_database_name"

BACKUP_DIR="/path/to/backup/directory"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

# pg_dump command to create the backup
pg_dump -U $DB_USER -h localhost -d $DB_NAME -F c -b -v -f $BACKUP_FILE

# Check if the pg_dump command was successful
if [ $? -eq 0 ]; then
    # Get the oldest backup file and delete it
    oldest_file=$(find "$BACKUP_DIR" -type f -exec ls -lt --time=atime {} + | tail -n 1 | awk '{print $NF}')
    rm -rf $oldest_file
    echo "Backup completed successfully. Backup file: $BACKUP_FILE"
else
    echo "Error: Backup failed."
fi
