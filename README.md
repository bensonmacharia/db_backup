# Database Backup Script

This is a bash script that can be used to automate database backup. The oldest backup file is deleted every time a new backup is created to save on space.

## Getting Started

To run the script

```bash

$ git clone https://github.com/bensonmacharia/db_backup.git
$ cd db_backup
# grant execution permissions. MySQL script
$ chmod +x mysql_db_backup_script.sh
# grant execution permissions. PostgreSQL script
$ chmod +x psql_db_backup_script.sh
# Make sure to edit the placeholders for the database credentials and backup directory before running the scripts
# run the scripts
$ ./mysql_db_backup_script.sh
$ ./psql_db_backup_script.sh

```

## Automated Backups

Setup a cronjob for this

```bash
$ crontab -e
# Press i to go to insert mode. Add the following line:
0 0 * * * /full/path/to/script/mysql_db_backup_script.sh
# this will run everyday at 0000HRS (mid-night)
# press Esc and type :wq to save and exit.
```
