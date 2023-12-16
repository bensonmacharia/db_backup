#!/bin/bash

# Database credentials
DB_USER="your_database_user"
DB_PASSWORD="your_database_password"
DB_NAME="your_database_name"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Timestamp (used for the backup file name)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup file name
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

# mysqldump command to create the backup
mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Check if the mysqldump command was successful
if [ $? -eq 0 ]; then
    # Get the oldest backup file and delete it
    oldest_file=$(find "$BACKUP_DIR" -type f -exec ls -lt --time=atime {} + | tail -n 1 | awk '{print $NF}')
    rm -rf $oldest_file
    echo "Backup completed successfully. Backup file: $BACKUP_FILE"
else
    echo "Error: Backup failed."
fi