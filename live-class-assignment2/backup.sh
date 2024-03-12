#!/bin/bash
# Expected input: ./backup.sh folder folder1
# Expected output:  folder.tar.gz

TIME=$(date +'%m-%d_%H-%M-%S')
SOURCE_DIR=$1
DESTINATION_DIR=$2

if [[ -z "$SOURCE_DIR" || -z "$DESTINATION_DIR" ]]
#if [ -z "$SOURCE_DIR" -o -z "$DESTINATION_DIR" ]
then
    echo "Cannot process without source and destination directory"
else
    tar -czvf "$SOURCE_DIR-backup-$TIME.tar.gz" "$SOURCE_DIR"
    mv "$SOURCE_DIR-backup-$TIME.tar.gz" "$DESTINATION_DIR"
    echo "Backup of $SOURCE_DIR created and saved in $DESTINATION_DIR..."
fi 

# Additionally, you can check if... 
# - the backup already exist
# - check if the given directory is empty
# - check if the destination directory exist, if not create one
