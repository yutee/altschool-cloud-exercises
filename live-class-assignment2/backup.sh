DIR=$PWD
TIME=$(date +'%Y_%m_%d_%H-%M-%S')
SOURCE_DIR=$1
DESTINATION_DIR=$2
BACKUP_DIR="$destination_directory/backup_$timestamp.tar.gz"

if [[ -d "$DESTINATION_DIR" ]]; then
  echo "$DESTINATION_DIR already exists"
else
   mkdir $DESTINATION_DIR
  echo "Successfully Created backup directory: ($DESTINATION_DIR)"
fi

# tar -cvzf "$BACKUP_DIR" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")" && echo "Backup Created Succesfully: $BACKUP_DIR"